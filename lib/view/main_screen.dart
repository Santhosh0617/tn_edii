import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/loaders.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';

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
      body: ListView(
        children: [
          ButtonPrimary(
              onPressed: () {
                context.push(Routes.singleCourseDetails);
                // context.push(Routes.trainingDashboard);
              },
              label: "view")
        ],
      ),
    );
  }
}
