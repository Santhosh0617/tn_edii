import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/assets/local_icons.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/training/widget/training_card.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final contSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBarCommon(
          title: "Trainings", automaticLeadingImplies: false, actions: actions),
      body: Consumer<TrainingProvider>(
        builder: (context, train, child) =>
            ListView(padding: EdgeInsets.zero, children: [
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

  List<Widget> get actions => [
        IconButton.outlined(
            onPressed: () => context.push(Routes.search),
            icon: Image.asset(LocalIcons.search, width: 25))
      ];
}
