import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';

class AppBarCommon extends StatelessWidget {
  const AppBarCommon({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.onRefresh,
    this.safeArea = true,
    this.automaticLeadingImplies = true,
    this.actions = const [],
    this.isStacked = false,
  });
  final String title, subTitle;
  final VoidCallback? onRefresh;
  final bool safeArea;
  final bool automaticLeadingImplies, isStacked;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInRight(
            child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Row(children: [
              if (automaticLeadingImplies) ...[
                if (isStacked)
                  SecondaryIconButton(context,
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new))
                else
                  IconButton.filled(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new)),
                const WidthFull()
              ],
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(title,
                      maxLines: 1, size: 18, fontWeight: FontWeight.w800),
                  if (subTitle.isNotEmpty)
                    TextCustom(subTitle,
                        color: Palette.secondary,
                        size: 12,
                        fontWeight: FontWeight.bold),
                ],
              )),
              ...actions
            ]),
          ),
        )),
      ],
    );
  }
}
