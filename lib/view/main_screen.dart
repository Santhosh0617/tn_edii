import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/course_type.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarMain(),
      body: widget.child,
      bottomBar: BottomNavBar(),
    );
  }
}
