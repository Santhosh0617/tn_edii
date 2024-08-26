import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/view/home/widgets/home_carousel.dart';
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
    return CustomScaffold(
      appBar: const AppBarMain(),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
          children: const [
            HomeCarousel(),
            HeightFull(),
            PopularTrainings(),
            Heading('Entrepreneurship Resources'),
            ResourceTypesTile()
          ]),
    );
  }
}
