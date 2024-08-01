import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/models/course_type.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class TrainingsTypesTile extends StatelessWidget {
  const TrainingsTypesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(courseTypes.length, (i) {
            CourseType courseType = courseTypes[i];
            bool isSelected = courseType == value.selectedCourseType;
            return GestureDetector(
              onTap: () => trainingsProvider.selectedCourseType = courseType,
              child: Container(
                margin: EdgeInsets.only(
                    left: i == 0 ? SizeUnit.lg : 0, right: SizeUnit.lg),
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeUnit.xlg, vertical: SizeUnit.sm),
                decoration: ThemeGuide.cardDecoration(
                    color: isSelected ? Palette.primary : Palette.secondary,
                    borderRadius: BorderRadius.circular(100)),
                child: TextCustom(
                  courseType.type,
                  color: isSelected ? Palette.pureWhite : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
