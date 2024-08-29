import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/common/widgets/shimmer_custom.dart';
import 'package:tn_edii/common/widgets/shimmer_list.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/home/widgets/home_trainings_tile.dart';

class PopularTrainings extends StatelessWidget {
  const PopularTrainings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingProvider>(builder: (context, value, child) {
      if (value.trainings.isEmpty) return const SizedBox();
      return Column(
        children: [
          Heading('Popular Trainings',
              onSeeAll: () => context.push(Routes.trainingList)),
          const TrainingsTypesTile(),
          const HeightFull(),
          value.isLoading
              ? SizedBox(
                  height: 216,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      padding:
                          const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                      separatorBuilder: (context, index) => const WidthFull(),
                      itemBuilder: (context, index) => ShimmerCustom(
                              child: Container(
                            decoration: ThemeGuide.cardDecoration(),
                            height: 200,
                            width: 300,
                          ))),
                )
              : SizedBox(
                  height: 216,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: value.selectedTrainings.length,
                      padding:
                          const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                      separatorBuilder: (context, index) => const WidthFull(),
                      itemBuilder: (context, index) => HomeTrainingsTile(
                          course: value.selectedTrainings[index])),
                ),
        ],
      );
    });
  }
}
