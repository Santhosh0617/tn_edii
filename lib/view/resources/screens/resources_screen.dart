import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/expense_type.dart';
import 'package:tn_edii/models/resource_model.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/view/home/widgets/resource_types_tile.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        automaticLeadingImplies: false,
        title: "Resources",
      ),
      body: Consumer<TrainingProvider>(
        builder: (context, train, child) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            children: [
              const ResourceTypesTile(),
              const HeightFull(),
              const Heading('Connect With Experts'),
              const HeightFull(),
              GridView.builder(
                  itemCount: resourceProvider.expenseTypes.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.28,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    ExpenseType expenseType = resourceProvider.expenseTypes[i];
                    // Resourses resourceData = resourceProvider.resourseData[i];
                    return InkWell(
                      onTap: () {
                        context.push(Routes.mentorDetail,extra: expenseType);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding:
                            const EdgeInsets.only(top: 12, right: 12, left: 12),
                        decoration: ThemeGuide.cardDecoration(),
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: ThemeGuide.cardDecoration(),
                              child: Image.asset(
                                expenseType.image,
                                height: 90,
                                width: context.widthFull(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const HeightHalf(),
                            Center(
                                child: TextCustom(expenseType.expense,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    );
                  }),
              const HeightFull(),
            ]);
        },
      ),
    );
  }
}
