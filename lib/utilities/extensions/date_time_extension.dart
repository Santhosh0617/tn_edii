import 'package:tn_edii/utilities/custom_date_time.dart';

extension DateTimeExtension on DateTime? {
  bool get isCurrentMonth {
    DateTime now = CustomDateTime().now;

    bool isCurrentMonth = this?.month == now.month && this?.year == now.year;
    return isCurrentMonth;
  }

  bool isSameMonth(DateTime selectedMonth) {
    DateTime now = selectedMonth;
    bool isCurrentMonth = this?.month == now.month && this?.year == now.year;
    return isCurrentMonth;
  }

  bool get isOldMonth {
    DateTime now = CustomDateTime().now;
    bool isOldMonth =
        (this?.month ?? 0) < now.month && (this?.year ?? 0) < now.year;
    return isOldMonth;
  }

  bool get isCurrentDate {
    DateTime now = CustomDateTime().now;
    bool isCurrentMonth = this?.month == now.month &&
        this?.year == now.year &&
        this?.day == now.day;
    return isCurrentMonth;
  }
}
