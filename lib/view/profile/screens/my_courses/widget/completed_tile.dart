import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class CompletedTile extends StatefulWidget {
  const CompletedTile({super.key});

  @override
  State<CompletedTile> createState() => _CompletedTileState();
}

class _CompletedTileState extends State<CompletedTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 5),
              itemBuilder: (context, index) {
                return const CourseCompletedContainer();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: SizeUnit.sm,);
              },
              itemCount: 10),
        )
      ],
    );
  }
}

class CourseCompletedContainer extends StatelessWidget {
  const CourseCompletedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => context.push(Routes.completedCourseDetails),
        child: Container(
          margin: EdgeInsets.only(top: SizeUnit.md),
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
                // child: Image.asset(LocalImages.js, fit: BoxFit.cover)
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(SizeUnit.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        "Graphic Design",
                        size: 14,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        color: Palette.orange,
                      ),
                      HeightHalf(),
                      TextCustom(
                        "JavaScript Advacned Ebook vdsfh",
                        size: 14,
                        fontWeight: FontWeight.w800,
                        maxLines: 1,
                        color: Palette.dark,
                      ),
                      HeightHalf(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Palette.yellow),
                          TextCustom("4.2",
                              size: 14,
                              color: Palette.dark,
                              fontWeight: FontWeight.w700),
                          WidthHalf(),
                          TextCustom(
                            "|",
                            size: 14,
                            color: Palette.dark,
                            fontWeight: FontWeight.w700,
                          ),
                          WidthHalf(),
                          TextCustom("2 Hrs 36 Mins",
                              size: 14,
                              color: Palette.dark,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                      HeightFull(),
                      HeightHalf(),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextCustom(
                          "View Certificate",
                          decoration: TextDecoration.underline,
                          size: 13,
                          fontWeight: FontWeight.w800,
                          decorationColor: Palette.greenAccent,
                          color: Palette.greenAccent,
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
