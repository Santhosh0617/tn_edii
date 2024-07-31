import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar:
          const AppBarCommon(automaticLeadingImplies: false, title: "Profile"),
      body: Container(
        padding: EdgeInsets.all(SizeUnit.lg),
        margin: EdgeInsets.all(SizeUnit.lg),
        decoration: ThemeGuide.cardDecoration(),
      ),
    );
  }
}
