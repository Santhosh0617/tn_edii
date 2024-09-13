import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/theme/palette.dart';

class TabBarTile extends StatelessWidget {
  const TabBarTile(
      {super.key,
      required this.onTap,
      required this.isSelected,
      required this.title,
      required this.isFirst});
  final VoidCallback onTap;
  final bool isSelected;
  final String title;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: isFirst ? 0 : SizeUnit.lg),
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            // border: Border.all(color: Palette.dark),
            color: isSelected ? Palette.primary : Palette.secondary),
        child: Center(
            child: TextCustom(
          title,
          color: isSelected ? Palette.pureWhite : Palette.dark,
          size: 14,
          fontWeight: FontWeight.w700,
        )),
      ),
    );
  }
}
