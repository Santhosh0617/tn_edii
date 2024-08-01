import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';

import 'package:tn_edii/view/training/widget/training_card.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar:
          const AppBarCommon(automaticLeadingImplies: false, title: "Training"),
      body: Consumer<TrainingProvider>(
        builder: (context, train, child) =>
            ListView(padding: EdgeInsets.zero, shrinkWrap: true, children: [
          const TrainingsTypesTile(),
          const HeightFull(),
          ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Training trainingDetails = train.selectedTrainings[index];
                return TrainingCard(trainingDetails: trainingDetails);
              },
              separatorBuilder: (context, index) => const HeightFull(),
              itemCount: train.selectedTrainings.length),
          const HeightFull(),
        ]),
      ),
    );
  }
}
