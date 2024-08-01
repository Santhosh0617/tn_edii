import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/bottom_sheets.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/view/resources/widgets/resource_card.dart';

class ResourceDetailScreen extends StatefulWidget {
  const ResourceDetailScreen({super.key});

  @override
  State<ResourceDetailScreen> createState() => _ResourceDetailScreenState();
}

class _ResourceDetailScreenState extends State<ResourceDetailScreen> {
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
        padding: EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        children: [
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ResourceCardTile();
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
