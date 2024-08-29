import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class ResourceCardTile extends StatefulWidget {
  const ResourceCardTile({super.key});

  @override
  State<ResourceCardTile> createState() => _ResourceCardTileState();
}

class _ResourceCardTileState extends State<ResourceCardTile> {
  @override
  Widget build(BuildContext context) {
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
              height: 128,
              width: 136,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22)),
                  color: Palette.dark),
              child: Image.asset(LocalImages.js, fit: BoxFit.cover)),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeUnit.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    "JavaScript Advacned Ebook",
                    size: 14,
                    fontWeight: FontWeight.w800,
                    maxLines: 1,
                    color: Palette.dark,
                  ),
                  HeightHalf(),
                  TextCustom(
                    "A Comprehensive ebook on javascript basics.",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Palette.grey,
                    maxLines: 2,
                  ),
                  HeightHalf(),
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: Palette.grey, size: 20),
                      WidthHalf(),
                      TextCustom(
                        "PraveenKumar",
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: Palette.grey,
                      ),
                    ],
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
