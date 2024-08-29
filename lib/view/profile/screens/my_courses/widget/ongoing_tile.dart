import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class OngoingTile extends StatefulWidget {
  const OngoingTile({super.key});

  @override
  State<OngoingTile> createState() => _OngoingTileState();
}

class _OngoingTileState extends State<OngoingTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(top: 5),
              itemBuilder: (context, index) {
                return const OngoingContainer();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: SizeUnit.sm,
                );
              },
              itemCount: 10),
        )
      ],
    );
  }
}

class OngoingContainer extends StatelessWidget {
  const OngoingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => context.push(Routes.onGoingCourseDetails),
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
                  logo:
                      "${AppStrings.apiUrl}users/uploads/training_images/2.jpeg"),
              // child: Image.asset(LocalImages.js, fit: BoxFit.cover)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustom(
                      "Graphic Design",
                      size: 14,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      color: Palette.orange,
                    ),
                    const HeightHalf(),
                    const TextCustom(
                      "JavaScript Advacned Ebook vdsfh",
                      size: 14,
                      fontWeight: FontWeight.w800,
                      maxLines: 1,
                      color: Palette.dark,
                    ),
                    const HeightHalf(),
                    const Row(
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
                    const HeightFull(),
                    const HeightHalf(),
                    Row(
                      children: [
                        SizedBox(
                          height: 6,
                          width: 150,
                          child: LinearProgressBar(
                            borderRadius: BorderRadius.circular(22),
                            maxSteps: 100,
                            progressType: LinearProgressBar.progressTypeLinear,
                            currentStep: 45,
                            progressColor: Palette.yellow,
                            backgroundColor: Palette.bg,
                          ),
                        ),
                        const WidthHalf(),
                        const TextCustom(
                          "45/100",
                          size: 14,
                          fontWeight: FontWeight.w800,
                          color: Palette.dark,
                        )
                      ],
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
