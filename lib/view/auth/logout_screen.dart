import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TextCustom('Logout', fontWeight: FontWeight.w600, size: 16),
      const HeightHalf(),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextCustom(
            "Are you sure you want to logout, it will clear all your local data",
            align: TextAlign.center,
            color: Palette.grey,
          )),
      const HeightFull(),
      Row(
        children: [
          Expanded(child: ButtonPrimary(onPressed: () {}, label: "Cancel")),
          const WidthFull(),
          Expanded(child: ButtonSecondary(onPressed: () {}, label: "Logout")),
        ],
      )
    ]);
  }
}
