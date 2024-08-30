import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/articles_model.dart';
import 'package:tn_edii/models/resource_type.dart';
import 'package:tn_edii/providers/resource_provider.dart';
import 'package:tn_edii/repositories/resource_repository.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';
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
    // ResourceRepository().getResources(context, resourceType.key);
    ResourceRepository().getArticles(context, resourceType.key);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      isStackedAppBar: false,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: resourceType.resource,
        isText: false,
      ),
      body: Consumer<ResourceProvider>(
        builder: (BuildContext context, value, child) {
          return value.articleData.isEmpty
              ? Center(
                  child: TextCustom(
                    "No ${resourceType.resource} available",
                    color: Palette.dark,
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(SizeUnit.lg),
                  itemBuilder: (context, index) {
                    ArticlesModel articleData = value.articleData[index];
                    return ResourceCardTile(data: articleData);
                  },
                  separatorBuilder: (context, index) => const HeightFull(),
                  itemCount: value.articleData.length);
        },
      ),
    );
  }
}
