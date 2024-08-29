import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/models/day.dart';
import 'package:tn_edii/models/week.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  void initState() {
    getDates(CustomDateTime().now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLessThanCurrent = selectedDate.isOldMonth;
    return Container(
      decoration: ThemeGuide.cardDecoration(),
      child: Column(
        children: [
          Container(
            width: context.widthFull(),
            padding: const EdgeInsets.symmetric(vertical: SizeUnit.sm),
            decoration: ThemeGuide.cardDecoration(
                color: Palette.primary,
                borderRadius: BorderRadius.vertical(top: ThemeGuide.radius)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => changeMonth(isIncrement: true),
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: TextCustom(month,
                      fontWeight: FontWeight.w700,
                      align: TextAlign.center,
                      size: 16,
                      maxLines: 1,
                      color: Palette.pureWhite),
                ),
                IconButton(
                    onPressed: changeMonth,
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),
          GridView.builder(
              itemCount: week.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, childAspectRatio: 1.4),
              itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(SizeUnit.sm),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Palette.grey.withOpacity(.3)),
                          left: BorderSide(
                              color: week[index].id != 7
                                  ? Palette.grey.withOpacity(.3)
                                  : Colors.transparent))),
                  child: TextCustom(week[index].day,
                      maxLines: 1, overflow: TextOverflow.clip))),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: days.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, childAspectRatio: .75),
            itemBuilder: (context, index) {
              Day date = days[index];
              bool hadEvent = Random().nextInt(days.length) == index;
              // bool hadEvent = 24 == index || 25 == index;
              return InkWell(
                  onTap: date.isCurrentMonth(selectedDate) ? () {} : () {},
                  splashFactory: NoSplash.splashFactory,
                  child: LayoutBuilder(builder: (context, ct) {
                    return Container(
                        decoration: BoxDecoration(
                            color:
                                hadEvent ? Palette.primary : Palette.pureWhite,
                            border: Border(
                                top: BorderSide(
                                    color: Palette.grey.withOpacity(.3)),
                                left: BorderSide(
                                    color: date.day != 7
                                        ? Palette.grey.withOpacity(.3)
                                        : Colors.transparent))),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: date.isCurrentDate
                                ? hadEvent
                                    ? Palette.pureWhite
                                    : Palette.primary
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: TextCustom(date.date.toString(),
                              color: date.isCurrentMonth(selectedDate)
                                  ? date.isCurrentDate
                                      ? hadEvent
                                          ? Palette.primary
                                          : Palette.pureWhite
                                      : hadEvent
                                          ? Palette.pureWhite
                                          : Palette.dark
                                  : Palette.grey),
                        ));
                  }));
            },
          ),
        ],
      ),
    );
  }

  void changeMonth({bool isIncrement = false}) {
    DateTime dateTime = selectedDate;
    int month = !isIncrement ? dateTime.month + 1 : dateTime.month - 1;
    getDates(DateTime(dateTime.year, month));
    setState(() {});
  }

  List<Week> week = [
    Week(id: 7, day: 'Sun'),
    Week(id: 1, day: 'Mon'),
    Week(id: 2, day: 'Tue'),
    Week(id: 3, day: 'Wed'),
    Week(id: 4, day: 'Thu'),
    Week(id: 5, day: 'Fri'),
    Week(id: 6, day: 'Sat'),
  ];

  List<Day> days = [];
  String month = '';
  String year = '';
  DateTime selectedDate = CustomDateTime().now;
  void getDates(DateTime dateTime) {
    selectedDate = dateTime;
    days = [];
    month = DateFormat('MMM yyyy').format(selectedDate);

    int nextMonthCount =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    for (var i = 1; i <= nextMonthCount; i++) {
      DateTime date = DateTime(selectedDate.year, selectedDate.month, i);

      if (i == 1 && date.weekday != 7) { 
        int prevMonthCount =
            DateTime(selectedDate.year, selectedDate.month, 0).day;
        List<Day> prevMonth = [];
        for (var y = 0; y < date.weekday; y++) {
          DateTime dateTime = DateTime(
              selectedDate.year, selectedDate.month - 1, prevMonthCount--);
          prevMonth.add(Day(dateTime: dateTime));
        }
        days = prevMonth.reversed.toList();
      }

      days.add(Day(dateTime: date));
      if (i == nextMonthCount && date.weekday != 6) {
        int count = week.indexWhere((element) => element.id == date.weekday);
        int no = 1;
        for (var y = count; y < week.length - 1; ++y) {
          logger.e(date);
          DateTime dateTime = date.add(Duration(days: no++));
          days.add(Day(dateTime: dateTime));
        }
      }
    }
  }
}
