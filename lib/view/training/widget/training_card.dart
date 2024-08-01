import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class TrainingCard extends StatelessWidget {
  const TrainingCard({
    super.key,
    required this.trainingDetails,
  });
  final Training trainingDetails;

  @override
  Widget build(BuildContext context) {
    String title = trainingDetails.title ?? '';
    String description = trainingDetails.description ?? "";
    String price = trainingDetails.feeAmount.toString();
    price = price == '0' ? 'Free' : price.money();
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 128,
      width: context.widthFull(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Palette.pureWhite),
      child: Row(
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              width: 136,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22)),
                  color: Palette.dark),
              child: const NetworkImageCustom(logo: "")),
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
                    maxLines: 1,
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
    );
  }
}
