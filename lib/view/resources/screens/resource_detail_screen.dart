import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/resource_type.dart';
import 'package:tn_edii/repositories/resource_repository.dart';
import 'package:tn_edii/view/resources/widgets/resource_card.dart';

class ResourceDetailScreen extends StatefulWidget {
  const ResourceDetailScreen({super.key});

  @override
  State<ResourceDetailScreen> createState() => _ResourceDetailScreenState();
}

class _ResourceDetailScreenState extends State<ResourceDetailScreen> {
  ResourceType get resourceType =>
      GoRouterState.of(context).extra as ResourceType;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) => init());
    super.initState();
  }

  void init() {
    ResourceRepository().getResources(context, resourceType.key);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: resourceType.resource,
        isText: false,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(SizeUnit.lg),
          itemBuilder: (context, index) => const ResourceCardTile(),
          separatorBuilder: (context, index) => const HeightFull(),
          itemCount: 6),
    );
  }
}
