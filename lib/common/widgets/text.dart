import 'package:flutter/material.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/double_extension.dart';
import 'package:readmore/readmore.dart';

class TextCustom extends StatelessWidget {
  final String value;
  final double? size;
  final Color? color,decorationColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? align;
  final TextDecoration? decoration;
  final double? height;
  final TextOverflow? overflow;
  const TextCustom(
    this.value, {
    super.key,
    this.size,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.align,
    this.decoration,
    this.height,
    this.overflow, this.decorationColor,
  });
  @override
  Widget build(BuildContext context) {
    double fontSize = (size ?? 14).getFontSize(context);
    return Text(
      value,
      maxLines: maxLines ?? 10000,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: align,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationColor: decorationColor,
          height: height),
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.subtitlecolor,
    this.titlecolor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleSize,
    this.subtitleSize,
  });
  final String title;
  final String subtitle;
  final Color? titlecolor;
  final Color? subtitlecolor;
  final double? titleSize;
  final double? subtitleSize;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: titleSize ?? 12,
              fontWeight: FontWeight.w700,
              color: titlecolor ?? Palette.grey),
        ),
        // const HeightHalf(),
        Text(
          maxLines: 2,
          subtitle,
          style: TextStyle(
              fontSize: subtitleSize ?? 12,
              fontWeight: FontWeight.w500,
              color: subtitlecolor ?? Palette.grey),
        ),
        const HeightHalf(),
      ],
    );
  }
}

class TextColumn extends StatelessWidget {
  const TextColumn(
      {super.key,
      required this.head,
      required this.value,
      this.color,
      this.isStart = false,
      this.isEnd = false});
  final String head, value;
  final Color? color;
  final bool isStart, isEnd;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: isEnd
            ? CrossAxisAlignment.end
            : isStart
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
        children: [
          TextCustom(head, size: 11, color: Palette.grey),
          const SizedBox(height: SizeUnit.sm / 4),
          TextCustom(value,
              fontWeight: FontWeight.w500,
              size: 15,
              color: color ?? Palette.grey)
        ]);
  }
}

class ReadMoreTextCustom extends StatelessWidget {
  const ReadMoreTextCustom(this.value,
      {super.key,
      this.size,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.align,
      this.height,
      this.moreFontWeight});
  final String value;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight, moreFontWeight;
  final int? maxLines;
  final TextAlign? align;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      value,
      trimExpandedText: ' less',
      trimCollapsedText: 'more',
      trimLines: 2,
      trimMode: TrimMode.Line,
      lessStyle: fontStyle(moreFontWeight: moreFontWeight),
      moreStyle: fontStyle(moreFontWeight: moreFontWeight),
      style: fontStyle(),
    );
  }

  double get fontSize => (size ?? 14);

  TextStyle fontStyle({FontWeight? moreFontWeight}) => TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: moreFontWeight ?? fontWeight,
      height: height);
}
