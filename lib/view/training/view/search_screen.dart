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
import 'package:tn_edii/view/training/widget/training_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void onChanged(String? value) {
    TrainingRepository().searchTrainings(context, search: contSearch.text);
  }

  final contSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(title: "Search Trainings"),
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
                isOptional: true,
                controller: contSearch,
                hint: 'Search for'),
          ),
          const HeightFull(),
          ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Training trainingDetails = train.searchedTrainings[index];
                return TrainingCard(trainingDetails: trainingDetails);
              },
              separatorBuilder: (context, index) => const HeightFull(),
              itemCount: train.searchedTrainings.length),
          const HeightFull(),
        ]),
      ),
    );
  }
}
