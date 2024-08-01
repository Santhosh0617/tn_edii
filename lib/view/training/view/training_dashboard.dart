import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';

import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';

import 'package:tn_edii/view/training/widget/training_card.dart';

class TrainingDashboard extends StatefulWidget {
  const TrainingDashboard({super.key});

  @override
  State<TrainingDashboard> createState() => _TrainingDashboardState();
}

class _TrainingDashboardState extends State<TrainingDashboard> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        automaticLeadingImplies: false,
        title: "My Courses",
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          shrinkWrap: true,
          children: [
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const TrainingCard(
                    title: 'Graphic design',
                    description:
                        "Graphic Design Advanced fiygewirfgieugfiug iugifgiu giugiugiur ufiurgfuigrugfugiug  ugugwofugoreufgog ogfo",
                    price: "₹ 499-/",
                  );
                },
                separatorBuilder: (context, index) {
                  return const HeightFull();
                },
                itemCount: 9),
            const HeightFull(),
          ]),
    );
  }
}
