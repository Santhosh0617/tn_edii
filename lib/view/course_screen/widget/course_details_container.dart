import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class CourseDetailsContainer extends StatefulWidget {
  const CourseDetailsContainer({
    super.key,
    required this.training,
  });
  final Training training;
  @override
  State<CourseDetailsContainer> createState() => _CourseDetailsContainerState();
}

class _CourseDetailsContainerState extends State<CourseDetailsContainer> {
  bool isAboutSelected = true;
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: SizeUnit.xlg * 14, left: SizeUnit.lg, right: SizeUnit.lg),
      // height: 394,
      width: context.widthFull(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Palette.pureWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightFull(multiplier: 2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const TextCustom("Graphic Design",
                //         size: 12,
                //         fontWeight: FontWeight.w700,
                //         color: Palette.orange),
                //     Row(
                //       children: [
                //         Icon(Icons.star, color: Palette.yellow),
                //         TextCustom(widget.training.rating ?? '')
                //       ],
                //     )
                //   ],
                // ),
                // HeightHalf(),
                TextCustom(
                  widget.training.title ?? '',
                  size: 18,
                  fontWeight: FontWeight.w700,
                ),
                const HeightHalf(),
                TextCustom(
                  widget.training.code ?? '',
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Palette.grey,
                ),
                const HeightHalf(),
                Row(
                  children: [
                    const TextCustom(
                      "Course Mode:",
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.dark,
                    ),
                    const WidthHalf(),
                    TextCustom(
                      widget.training.mode ?? '',
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.grey,
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //         child: TextCustom(
                //       "Design Principles: ",
                //       size: 18,
                //       fontWeight: FontWeight.w700,
                //       color: Palette.dark,
                //     )),
                //     Expanded(
                //         child: TextCustom(
                //       "Stack is a useful widget in Flutter which has the Last in First out structure. We use stack to add",
                //       size: 18,
                //       fontWeight: FontWeight.w700,
                //       color: Palette.dark,
                //       maxLines: 1,
                //     )),
                //   ],
                // ),
                const HeightHalf(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Icon(Icons.camera),
                //         TextCustom(" 21 Class", fontWeight: FontWeight.w800),
                //         SizedBox(width: SizeUnit.sm),
                //         TextCustom("|", fontWeight: FontWeight.w800),
                //         SizedBox(width: SizeUnit.sm),
                //         Icon(Icons.lock_clock_rounded),
                //         TextCustom(" 21 Class", fontWeight: FontWeight.w800),
                //       ],
                //     ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextCustom(
                      "Course Fee:",
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.dark,
                    ),
                    TextCustom(
                      widget.training.feeAmount.toString().money(),
                      size: 21,
                      fontWeight: FontWeight.w800,
                      color: Palette.primary,
                    ),
                  ],
                ),
                const HeightHalf(),
                const TextCustom(
                  "Description:",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Palette.dark,
                ),
                ReadMoreText(
                  widget.training.description ?? "-",
                  trimMode: TrimMode.Line,
                  textAlign: TextAlign.justify,
                  trimLines: 3,
                  colorClickableText: Palette.primary,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Palette.grey),
                  moreStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Palette.primary,
                      decoration: TextDecoration.underline),
                  lessStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Palette.primary,
                      decoration: TextDecoration.underline),
                ),
                //   ],
                // ),
              ],
            ),
          ),
          // const HeightFull(),
          // Row(
          //   children: [
          //     Expanded(
          //       child: InkWell(
          //         onTap: () {
          //           _onItemTapped(true);
          //         },
          //         child: Container(
          //           margin: EdgeInsets.zero,
          //           height: 50,
          //           width: context.widthHalf(),
          //           color:
          //               isAboutSelected ? Palette.primary : Palette.secondary,
          //           child: Center(
          //             child: TextCustom(
          //               "About",
          //               size: 16,
          //               color:
          //                   isAboutSelected ? Palette.pureWhite : Palette.dark,
          //               fontWeight: FontWeight.w800,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: InkWell(
          //         onTap: () {
          //           _onItemTapped(false);
          //         },
          //         child: Container(
          //           margin: EdgeInsets.zero,
          //           height: 50,
          //           width: context.widthHalf(),
          //           color:
          //               !isAboutSelected ? Palette.primary : Palette.secondary,
          //           child: Center(
          //             child: TextCustom(
          //               "Curriculum",
          //               size: 16,
          //               color:
          //                   !isAboutSelected ? Palette.pureWhite : Palette.dark,
          //               fontWeight: FontWeight.w800,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // HeightFull(),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          //   child: Column(
          //     children: [
          //       if (isAboutSelected == true) ...[
          //         const HeightFull(),
          //          ReadMoreText(
          //           widget.training.description??"-",
          //           trimMode: TrimMode.Line,
          //           textAlign: TextAlign.justify,
          //           trimLines: 3,
          //           colorClickableText: Palette.primary,
          //           trimCollapsedText: 'Show More',
          //           trimExpandedText: 'Show Less',
          //           style: const TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w700,
          //               height: 1.5,
          //               color: Palette.grey),
          //           moreStyle: const TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w700,
          //               color: Palette.primary,
          //               decoration: TextDecoration.underline),
          //           lessStyle: const TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w700,
          //               color: Palette.primary,
          //               decoration: TextDecoration.underline),
          //         ),
          //       ],
          //       if (isAboutSelected == false) ...[
          //         const HeightFull(),
          //         const Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 TextCustom(
          //                   "Section 01 - ",
          //                   size: 15,
          //                   fontWeight: FontWeight.w800,
          //                 ),
          //                 TextCustom(
          //                   "Introducation",
          //                   size: 15,
          //                   fontWeight: FontWeight.w800,
          //                   color: Palette.primary,
          //                 ),
          //               ],
          //             ),
          //             TextCustom(
          //               "25 Mins",
          //               size: 15,
          //               fontWeight: FontWeight.w800,
          //               color: Palette.primary,
          //             )
          //           ],
          //         ),
          //         const HeightFull(),
          //         ListView.separated(
          //             padding: EdgeInsets.zero,
          //             physics: const NeverScrollableScrollPhysics(),
          //             shrinkWrap: true,
          //             itemBuilder: (context, index) {
          //               return const CurriculumListTile();
          //             },
          //             separatorBuilder: (context, index) {
          //               return const Divider(
          //                 color: Palette.grey,
          //               );
          //             },
          //             itemCount: 3)
          //       ]
          //     ],
          //   ),
          // ),
          const HeightFull(),
        ],
      ),
    );
  }
}
