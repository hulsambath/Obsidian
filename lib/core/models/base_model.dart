import 'dart:convert';

abstract class BaseModel {
  Map<String, dynamic> toJson();

  Map<String, dynamic> permit(List<String> permitAttributes) {
    return Map.fromEntries(toJson().entries.where((element) {
      return permitAttributes.contains(element.key);
    }));
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

int? toInt(Map<dynamic, dynamic> json, String key) => int.tryParse(json[key]?.toString() ?? '');
double? toDouble(Map<dynamic, dynamic> json, String key) => double.tryParse(json[key]?.toString() ?? '');
DateTime? toLocal(dynamic date) {
  if (date == null) return null;
  if (date is DateTime) return date.toUtc();
  return DateTime.tryParse(date.toString())?.toLocal();
}

Map? toMap(Map<dynamic, dynamic> json, String key) {
  if (json[key] is Map) return json[key];
  if (json[key] is String) return jsonDecode(json[key]);
  return null;
}

Map<String, dynamic> filterOutNull(Map<String, dynamic> json) {
  Map<String, dynamic> clonedJson = {...json};
  clonedJson.forEach(
    (key, _) {
      dynamic value = clonedJson[key];
      if (value != null && value is List) {
        value.removeWhere((e) => _shouldFilterOut(e));
        if (value.isNotEmpty) clonedJson[key] = value;
      }
    },
  );
  clonedJson.removeWhere((key, value) => _shouldFilterOut(value));
  return clonedJson;
}

bool _shouldFilterOut(dynamic value) {
  return value == null || (value.toString().trim().isEmpty) || (value is List && value.isEmpty);
}
