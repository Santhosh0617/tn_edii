import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/training/widget/calender.dart';

import 'package:tn_edii/view/training/widget/training_card.dart';
import 'package:calendar_view/calendar_view.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController()..addAll([]),
      child: CustomScaffold(
        appBar:
            const AppBarCommon(automaticLeadingImplies: false, title: "Events"),
        body: Consumer<TrainingProvider>(
          builder: (context, train, child) => ListView(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              children: [
                const Calender(),
                Container(
                  decoration: ThemeGuide.cardDecoration(),
                ),
                const HeightFull(),
                if (train.selectedTrainings.isNotEmpty)
                  TrainingCard(trainingDetails: train.selectedTrainings[0]),
                const HeightFull(),
              ]),
        ),
      ),
    );
  }
}
