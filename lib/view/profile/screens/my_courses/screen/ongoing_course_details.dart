import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/completed_tile.dart';

class OnGoingCourseDetails extends StatefulWidget {
  const OnGoingCourseDetails({super.key});

  @override
  State<OnGoingCourseDetails> createState() => _OnGoingCourseDetailsState();
}

class _OnGoingCourseDetailsState extends State<OnGoingCourseDetails> {
  final TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        color: Palette.bg,
        appBar: const AppBarCommon(
            automaticLeadingImplies: true, title: "My Courses", isText: false),
        bottomBar: Padding(
            padding: EdgeInsets.all(SizeUnit.lg),
            child: ButtonPrimary(
                onPressed: () =>
                    commonDialog(context, const CourseCompletedDialog()),
                label: 'Continue')),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(SizeUnit.lg),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Palette.pureWhite),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextCustom("Section ${index + 1} -",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.dark),
                                  const TextCustom(" Title",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.primary),
                                ],
                              ),
                              const TextCustom("125 Min",
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.primary)
                            ],
                          ),
                          ...List.generate(2, (index) {
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              leading: CircleAvatar(
                                backgroundColor: Palette.bg,
                                child: TextCustom(
                                  "${index + 1}",
                                  size: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Palette.dark,
                                ),
                              ),
                              title: TextCustom(
                                "Why Using 3D Blender",
                                size: 15,
                                maxLines: 1,
                                fontWeight: FontWeight.w700,
                                color: Palette.dark,
                              ),
                              // subtitle: ,
                            );
                          })

                          // ListView.separated(
                          //   physics: NeverScrollableScrollPhysics(),
                          //     itemBuilder: (context, index) {
                          //       return ListTile(
                          //         leading: CircleAvatar(
                          //           backgroundColor: Palette.bg,
                          //           child: TextCustom("${index + 1}"),
                          //         ),
                          //       );
                          //     },
                          //     separatorBuilder: (context, index) {
                          //       return Divider();
                          //     },
                          //     itemCount: 2)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const HeightFull();
                  },
                  itemCount: 25),
            ),
          ],
        )
        // ListView(
        //   shrinkWrap: true,
        //   physics:NeverScrollableScrollPhysics(),
        //   padding: const EdgeInsets.all(SizeUnit.xlg),

        //   children: [
        //     HeightFull(),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        //       height: context.heightFull(),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(22),
        //           color: Palette.pureWhite),
        //           child: SizedBox(
        //             height: context.heightFull(),
        //             child: ListView.separated(
        //               // physics: const NeverScrollableScrollPhysics(),
        //                 itemBuilder: (context, index) {
        //                   return  const Column(
        //                     children: [
        //                       Row(
        //                         children: [
        //                           TextCustom("Section 01 -",size: 14,fontWeight: FontWeight.w600,color: Palette.dark,),
        //                           TextCustom(" Title",size: 14,fontWeight: FontWeight.w600,color: Palette.primary,),

        //                         ],
        //                       )
        //                     ],
        //                   );
        //                 },
        //                 separatorBuilder: (context, index) {
        //                   return const Divider();
        //                 },
        //                 itemCount: 20),
        //           ) ,
        //     ),

        //   ],
        // ),
        );
  }
}
