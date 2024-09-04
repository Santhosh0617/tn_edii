import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/my_course.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class OngoingTile extends StatefulWidget {
  const OngoingTile({super.key});

  @override
  State<OngoingTile> createState() => _OngoingTileState();
}

class _OngoingTileState extends State<OngoingTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(builder: (context, value, child) {
      List onGoingCourse =
          value.myCourses.where((e) => e.isCourseCompleted == false).toList();
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 5),
                itemBuilder: (context, index) =>
                    OngoingContainer(course: onGoingCourse[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: SizeUnit.sm),
                itemCount: onGoingCourse.length),
          )
        ],
      );
    });
  }
}

class OngoingContainer extends StatelessWidget {
  const OngoingContainer({
    super.key,
    required this.course,
  });

  final MyCourse course;

  @override
  Widget build(BuildContext context) {
    String price = course.training?.feeAmount.toString() ?? '';
    price = price == '0' ? 'Free' : price.money();
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => context.push(Routes.onGoingCourseDetails, extra: course),
      child: Container(
        margin: const EdgeInsets.only(top: SizeUnit.md),
        clipBehavior: Clip.hardEdge,
        height: 158,
        width: context.widthFull(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Palette.pureWhite),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 158,
              width: 136,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22)),
                  color: Palette.dark),
              child: NetworkImageCustom(
                  logo: "${course.trainingId}.jpeg"
                      .toImageUrl(subFolder: 'training_images')),
              // child: Image.asset(LocalImages.js, fit: BoxFit.cover)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      course.training?.title ?? '',
                      size: 14,
                      fontWeight: FontWeight.w800,
                      maxLines: 1,
                      color: Palette.dark,
                    ),
                    const HeightHalf(),
                    TextCustom(
                      course.training?.description ?? '',
                      size: 13,
                      fontWeight: FontWeight.w500,
                      color: Palette.grey,
                      maxLines: 2,
                    ),
                    // const HeightFull(),
                    const Spacer(),
                    TextCustom(
                      price,
                      size: 16,
                      fontWeight: FontWeight.w800,
                      color: Palette.primary,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
