abstract class BaseModel {
  Map<String, dynamic> toJson();

  // if date is in another type, it will tryParse date and to DateTime then parse to Local
  static DateTime? toLocal(dynamic date) {
    if (date == null) return null;
    if (date is DateTime) return date.toLocal();
    return DateTime.tryParse(date.toString())?.toLocal();
  }
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
