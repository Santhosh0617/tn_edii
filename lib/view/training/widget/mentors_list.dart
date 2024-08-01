import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';

import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';

import 'package:tn_edii/view/training/widget/training_card.dart';

class MentorsListTile extends StatefulWidget {
  const MentorsListTile({super.key});

  @override
  State<MentorsListTile> createState() => _MentorsListTileState();
}

class _MentorsListTileState extends State<MentorsListTile> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        automaticLeadingImplies: false,
        title: "mentors",
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          shrinkWrap: true,
          children: [
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      maxRadius: 35,
                      backgroundColor: Palette.accent,
                    ),
                    title: TextCustom(
                      "Name",
                      size: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    subtitle: TextCustom(
                      "Subtitl",
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: Palette.grey,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const HeightFull();
                },
                itemCount: 9),
            const HeightFull(),
          ]),
    );
  }
}
