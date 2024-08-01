import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/home/widgets/home_trainings_list.dart';
import 'package:tn_edii/view/home/widgets/resource_types_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    logger.e(authProvider.accessToken);
    return CustomScaffold(
      appBar: const AppBarMain(),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
          children: [
            Heading('Popular Trainings', onSeeAll: () {
              context.push(Routes.training);
            }),
            const TrainingsTypesTile(),
            const HeightFull(),
            const HomeTrainingsList(),
            const HeightFull(),
            const Heading('Entrepreneurship Resources'),
            const HeightFull(),
            const ResourceTypesTile()
          ]),
    );
  }
}
