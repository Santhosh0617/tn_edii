import 'package:intl/intl.dart';
import 'package:tn_edii/utilities/extensions/date_time_extension.dart';

class Day {
  DateTime dateTime;

  Day({required this.dateTime});

  int get date => dateTime.day;
  int get day => dateTime.weekday;
  String get fullDate => DateFormat('yyyy-MM-dd').format(dateTime);
  bool isCurrentMonth(DateTime selectedMonth) =>
      dateTime.isSameMonth(selectedMonth);
  bool get isCurrentDate => dateTime.isCurrentDate;
}
