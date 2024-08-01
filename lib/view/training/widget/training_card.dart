import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class TrainingCard extends StatelessWidget {
  const TrainingCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 138,
      width: context.widthFull(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Palette.pureWhite),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 138,
            width: 136,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22)),
                color: Palette.pureDark),
            child: Image.asset(
              LocalImages.sampleImg,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    title,
                    size: 14,
                    fontWeight: FontWeight.w800,
                    color: Palette.dark,
                  ),
                  const HeightHalf(),
                  TextCustom(
                    description,
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Palette.grey,
                    maxLines: 2,
                  ),
                  const HeightFull(),
                  TextCustom(
                    price,
                    size: 17,
                    fontWeight: FontWeight.w800,
                    color: Palette.primary,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
