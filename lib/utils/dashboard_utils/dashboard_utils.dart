import 'package:cloud_firestore/cloud_firestore.dart';


class DashBoardUtils {
 
  DateTime? toDateTime(dynamic dateValue) {
    if (dateValue is DateTime) {
      return dateValue;
    } else if (dateValue is String) {
      return DateTime.parse(dateValue);
    } else if (dateValue is Timestamp) {
      return dateValue.toDate();
    } else {
      return null;
    }
  }
}
