import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/view/home/widgets/home_course_tile.dart';

class HomeCourseList extends StatelessWidget {
  const HomeCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: value.courses.length,
                  padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                  separatorBuilder: (context, index) => const WidthFull(),
                  itemBuilder: (context, index) =>
                      HomeCourseTile(course: value.courses[index])),
            ));
  }
}
