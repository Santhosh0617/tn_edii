import 'package:animate_do/animate_do.dart';
import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar_data.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar_item.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/theme/Palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isVisible = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => initialize());
    super.initState();
  }

  void initialize() {
    isVisible = true;
    setState(() {});
  }

  List data = BottomBarData().data;
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: SizeUnit.md, horizontal: SizeUnit.lg),
        decoration: ThemeGuide.cardDecoration(
            borderRadius: BorderRadius.vertical(top: ThemeGuide.radius),
            color: Palette.pureWhite),
        child: AnimatedVisibility(
          visible: isVisible,
          enterDuration: const Duration(milliseconds: 500),
          enter: slideInVertically(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                data.length, (index) => BottomBarItem(data: data[index])),
          ),
        ),
      ),
    );
  }
}
