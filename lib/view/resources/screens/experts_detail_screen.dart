import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/view/resources/widgets/resource_card.dart';

class ExpertsDetailScreen extends StatefulWidget {
  const ExpertsDetailScreen({super.key});

  @override
  State<ExpertsDetailScreen> createState() => _ExpertsDetailScreenState();
}

class _ExpertsDetailScreenState extends State<ExpertsDetailScreen> {
  String get title => GoRouterState.of(context).extra as String;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: title,
        isText: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        children: [
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const ResourceCardTile();
              },
              separatorBuilder: (context, index) {
                return const HeightFull();
              },
              itemCount: 6),
        ],
      ),
    );
  }
}
