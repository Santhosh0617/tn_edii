import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_validator.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/my_course.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/repositories/feedback_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class CompletedTile extends StatefulWidget {
  const CompletedTile({super.key});

  @override
  State<CompletedTile> createState() => _CompletedTileState();
}

class _CompletedTileState extends State<CompletedTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, value, child) {
        List completedCourses =
            value.myCourses.where((e) => e.isCourseCompleted == true).toList();
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.only(top: 5),
                  itemBuilder: (context, index) =>
                      CourseCompletedContainer(course: completedCourses[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: SizeUnit.sm),
                  itemCount: completedCourses.length),
            )
          ],
        );
      },
    );
  }
}

class CourseCompletedContainer extends StatelessWidget {
  const CourseCompletedContainer({super.key, required this.course});
  final MyCourse course;
  @override
  Widget build(BuildContext context) {
    Training? training = course.training;
    return Stack(children: [
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => context.push(Routes.completedCourseDetails),
        child: Container(
          margin: const EdgeInsets.only(top: SizeUnit.md),
          clipBehavior: Clip.hardEdge,
          height: 158,
          width: context.widthFull(),
          decoration: BoxDecoration(
              border: Border.all(color: Palette.grey.withOpacity(.2)),
              borderRadius: BorderRadius.circular(22),
              color: Palette.pureWhite),
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
                    logo: "${course.id}.jpeg"
                        .toImageUrl(subFolder: 'training_images')),
                // child: Image.asset(LocalImages.js, fit: BoxFit.cover)
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(SizeUnit.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextCustom(
                      //   training?.title ?? '',
                      //   size: 14,
                      //   fontWeight: FontWeight.w600,
                      //   maxLines: 1,
                      //   color: Palette.orange,
                      // ),
                      // const HeightHalf(),
                      TextCustom(
                        training?.title ?? '',
                        size: 14,
                        fontWeight: FontWeight.w800,
                        maxLines: 1,
                        color: Palette.dark,
                      ),
                      const HeightHalf(),
                      TextCustom(
                        training?.description ?? '',
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: Palette.grey,
                        maxLines: 2,
                      ),
                      // const HeightFull(),
                      const Spacer(),
                      // const Row(
                      //   children: [
                      //     Icon(Icons.star, color: Palette.yellow),
                      //     TextCustom("4.2",
                      //         size: 14,
                      //         color: Palette.dark,
                      //         fontWeight: FontWeight.w700),
                      //     WidthHalf(),
                      //     TextCustom(
                      //       "|",
                      //       size: 14,
                      //       color: Palette.dark,
                      //       fontWeight: FontWeight.w700,
                      //     ),
                      //     WidthHalf(),
                      //     TextCustom("2 Hrs 36 Mins",
                      //         size: 14,
                      //         color: Palette.dark,
                      //         fontWeight: FontWeight.w700),
                      //   ],
                      // ),
                      const HeightFull(),
                      const HeightHalf(),
                      InkWell(
                        onTap: () {
                          (course.certificatePath ?? '').toString().isEmpty
                              ? commonDialog(context,
                                  CourseCompletedDialog(course: course))
                              : context.push(Routes.pdfView,
                                  extra: course.certificatePath);
                        },
                        child: const Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextCustom("View Certificate",
                              decoration: TextDecoration.underline,
                              size: 13,
                              fontWeight: FontWeight.w800,
                              decorationColor: Palette.greenAccent,
                              color: Palette.greenAccent),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
          top: 1.5, right: 28.0, child: Image.asset("assets/icons/Group 7.png"))
    ]);
  }
}

class CourseCompletedDialog extends StatelessWidget {
  const CourseCompletedDialog({super.key, required this.course});
  final MyCourse? course;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, color: Palette.dark, size: 28))
      ]),
      const HeightFull(),
      Image.asset("assets/images/Group 31.png",
          height: context.heightQuarter() - 60),
      const HeightFull(multiplier: 2),
      const TextCustom("Course Completed",
          fontWeight: FontWeight.bold, size: 22),
      const HeightHalf(),
      const TextCustom("Complete your Course. Please Write a\n Review",
          align: TextAlign.center,
          color: Palette.grey,
          fontWeight: FontWeight.w500),
      const HeightFull(),
      // Image.asset("assets/images/Star1.png", height: 24),
      const HeightFull(multiplier: 2),
      InkWell(
        onTap: () {
          commonBottomSheetReport(context, ReviewBottomSheet(course: course));
        },
        child: Container(
          width: context.widthHalf() + 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44), color: Palette.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextCustom(
                  "Write your Review",
                  fontWeight: FontWeight.bold,
                  color: Palette.pureWhite,
                  size: 15,
                ),
              ),
              const WidthHalf(),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Palette.pureWhite),
                child: const Icon(Icons.arrow_forward, color: Palette.primary),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({super.key, required this.course});
  final MyCourse? course;
  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  TextEditingController feedbackController = TextEditingController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child:
              const TextCustom("Review", size: 16, fontWeight: FontWeight.bold),
        ),
        const HeightFull(),
        Center(
          child: const TextCustom("How did you think about this training?",
              fontWeight: FontWeight.normal),
        ),
        const HeightFull(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  // Toggle the selected star
                  if (selectedIndex == index) {
                    selectedIndex = -1;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
              child: Icon(
                selectedIndex >= index ? Icons.star : Icons.star_outline,
                size: 34,
                color: selectedIndex >= index ? Colors.amber : Colors.grey,
              ),
            );
          }),
        ),
        HeightFull(),
        FeedbackTextfield(
          controller: feedbackController,
          hint: "Please write your honest review",
          onChanged: (p0) {
            setState(() {
              hasError = p0.isEmpty;
            });
          },
        ),
        CustomValidator('The review field is required', isShow: hasError),
        const HeightFull(multiplier: 2),
        Row(
          children: [
            Expanded(
              child: ButtonPrimary(onPressed: hitAPI, label: "Submit"),
            ),
          ],
        ),
        const HeightFull(),
      ]),
    );
  }

  bool hasError = false;
  hitAPI() async {
    hasError = feedbackController.text.isEmpty;
    setState(() {});
    if (hasError) return;
    Map<String, dynamic> params = {
      'rating': selectedIndex + 1,
      'description': feedbackController.text,
      'userId': authProvider.user?.id,
      'courseId': widget.course?.id
    };

    bool isFeedbackAdded =
        await FeedbackRepository().addFeedback(context, params);
    if (!isFeedbackAdded) return;
    context.pop();
  }
}

commonDialog(BuildContext context, Widget child) {
  return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Scaffold(
              backgroundColor: const Color(0xffB88187).withOpacity(.6),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Palette.pureWhite,
                            borderRadius: BorderRadius.circular(12)),
                        width: size.width - 24,
                        child: Padding(
                            padding: const EdgeInsets.all(16), child: child)),
                  ],
                ),
              )),
        );
      });
}

commonBottomSheetReport(BuildContext context, Widget child) =>
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          // Wrap your content in SingleChildScrollView
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: child,
          ),
        );
      },
    );
