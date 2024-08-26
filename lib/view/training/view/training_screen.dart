import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/theme/Palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/training/widget/calender.dart';

import 'package:tn_edii/view/training/widget/training_card.dart';
import 'package:calendar_view/calendar_view.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll([]),
      child: CustomScaffold(
        appBar: const AppBarCommon(
            automaticLeadingImplies: false, title: "Trainings"),
        body: Consumer<TrainingProvider>(
          builder: (context, train, child) =>
              ListView(padding: const EdgeInsets.all(SizeUnit.lg), children: [
            const Calender(),
            Container(
              decoration: ThemeGuide.cardDecoration(),
            ),
            const HeightFull(),
            if (train.selectedTrainings.isNotEmpty)
              TrainingCard(trainingDetails: train.selectedTrainings[0]),
            // const TrainingsTypesTile(),
            // const HeightFull(),
            // ListView.separated(
            //     padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       Training trainingDetails = train.selectedTrainings[index];
            //       return TrainingCard(trainingDetails: trainingDetails);
            //     },
            //     separatorBuilder: (context, index) => const HeightFull(),
            //     itemCount: train.selectedTrainings.length),
            // const HeightFull(),
          ]),
        ),
      ),
    );
  }
}
