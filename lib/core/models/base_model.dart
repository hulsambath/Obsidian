abstract class BaseModel {
  Map<String, dynamic> toJson();

  // if date is in another type, it will tryParse date and to DateTime then parse to Local
  static DateTime? toLocal(dynamic date) {
    if (date == null) return null;
    if (date is DateTime) return date.toLocal();
    return DateTime.tryParse(date.toString())?.toLocal();
  }
}
