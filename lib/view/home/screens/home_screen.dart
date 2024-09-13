import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/repositories/training_repository.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/home/widgets/home_carousel.dart';
import 'package:tn_edii/view/home/widgets/home_trainings_list.dart';
import 'package:tn_edii/view/home/widgets/resource_types_tile.dart';

bool profileDismissed = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarMain(),
      body: RefreshIndicator(
        onRefresh: () => TrainingRepository().getTrainings(context),
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
            children: [
              const HomeCarousel(),
              const HeightFull(),
              Container(
                decoration: ThemeGuide.cardDecoration(),
                padding: const EdgeInsets.all(SizeUnit.lg),
                margin: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom('Complete Your Profile',
                          size: 18, fontWeight: FontWeight.bold),
                      HeightHalf(),
                      TextCustom(
                          'You need to complete your profile to enroll a course'),
                      HeightFull(),
                      TextCustom('Complete Now')
                    ]),
              ),
              const PopularTrainings(),
              const Heading('Entrepreneurship Resources'),
              const ResourceTypesTile()
            ]),
      ),
    );
  }
}
