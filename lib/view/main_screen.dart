import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';

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
      body: widget.child,
      bottomBar: BottomNavBar(),
    );
  }
}
