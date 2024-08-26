import 'package:tn_edii/utilities/custom_date_time.dart';

extension DateTimeExtension on DateTime {
  bool get isCurrentMonth {
    DateTime now = CustomDateTime().now;
    bool isCurrentMonth = month == now.month && year == now.year;
    return isCurrentMonth;
  }

  bool isSameMonth(DateTime selectedMonth) {
    DateTime now = selectedMonth;
    bool isCurrentMonth = month == now.month && year == now.year;
    return isCurrentMonth;
  }

  bool get isOldMonth {
    DateTime now = CustomDateTime().now;
    bool isOldMonth = month < now.month && year < now.year;
    return isOldMonth;
  }

  bool get isCurrentDate {
    DateTime now = CustomDateTime().now;
    bool isCurrentMonth =
        month == now.month && year == now.year && day == now.day;
    return isCurrentMonth;
  }
}
