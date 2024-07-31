import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/models/course.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class HomeCourseTile extends StatelessWidget {
  const HomeCourseTile({
    super.key,
    required this.course,
  });
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      clipBehavior: Clip.antiAlias,
      decoration: ThemeGuide.cardDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Container(color: Palette.dark),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeUnit.lg, vertical: SizeUnit.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                'Graphic Design Advanced',
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              TextCustom(
                'PT-0091',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
