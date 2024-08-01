import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/view/home/widgets/home_trainings_tile.dart';

class HomeTrainingsList extends StatelessWidget {
  const HomeTrainingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingProvider>(
        builder: (context, value, child) => SizedBox(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: value.selectedTrainings.length,
                  padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                  separatorBuilder: (context, index) => const WidthFull(),
                  itemBuilder: (context, index) => HomeTrainingsTile(
                      course: value.selectedTrainings[index])),
            ));
  }
}
