import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';

import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/expense_type.dart';
import 'package:tn_edii/models/resource_type.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

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
        builder: (context, train, child) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
            shrinkWrap: true,
            children: [
              GridView.builder(
                  itemCount: resourceProvider.resourceTypes.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.3,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    ResourceType resourceType =
                        resourceProvider.resourceTypes[i];

                    return InkWell(
                      onTap: () {
                        context.push(Routes.resourcesDetail,
                            extra: resourceType);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: ThemeGuide.cardDecoration(),
                        child: Column(
                          children: [
                            Image.asset(
                              resourceType.image,
                              height: 100,
                              width: context.widthFull(),
                              fit: BoxFit.cover,
                            ),
                            const HeightHalf(),
                            Center(
                                child: TextCustom(resourceType.resource,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    );
                  }),
              const HeightFull(),
              const TextCustom("Connect With Expense",
                  maxLines: 1, size: 16, fontWeight: FontWeight.bold),
              const HeightFull(),
              GridView.builder(
                  itemCount: resourceProvider.resourceTypes.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.3,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    ExpenseType expenseType = resourceProvider.expenseTypes[i];
                    return InkWell(
                      onTap: () {
                        context.push(Routes.mentorDetail, extra: expenseType);
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: ThemeGuide.cardDecoration(),
                        child: Column(
                          children: [
                            Image.asset(
                              expenseType.image,
                              height: 100,
                              width: context.widthFull(),
                              fit: BoxFit.cover,
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
            ]),
      ),
    );
  }
}
