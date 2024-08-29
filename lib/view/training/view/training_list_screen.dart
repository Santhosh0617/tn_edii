import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/assets/local_icons.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/repositories/training_repository.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/training/widget/training_card.dart';

class TrainingListScreen extends StatefulWidget {
  const TrainingListScreen({super.key});

  @override
  State<TrainingListScreen> createState() => _TrainingListScreenState();
}

class _TrainingListScreenState extends State<TrainingListScreen> {
  void onChanged(String? value) {
    // TrainingRepository().getTrainings(context, search: contSearch.text);
  }

  final contSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(title: "Trainings"),
      body: Consumer<TrainingProvider>(
        builder: (context, train, child) =>
            ListView(padding: EdgeInsets.zero, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
            child: TextFormFieldCustom(
                prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(LocalIcons.search, width: 20),
                    ]),
                onChanged: onChanged,
                controller: contSearch,
                hint: 'Search for'),
          ),
          const HeightFull(),
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
