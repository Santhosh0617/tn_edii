import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/providers/auth_provider.dart';
import 'package:tn_edii/theme/palette.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) => FadeInRight(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom('Hi, ${value.user?.name ?? ''}',
                        size: 18, fontWeight: FontWeight.w700, maxLines: 1),
                    const TextCustom('What would you like to learn today?',
                        color: Palette.grey, fontWeight: FontWeight.bold),
                  ]),
            ),
            // const WidthFull(),
            // IconButton.outlined(
            //     style: Theme.of(context).iconButtonTheme.style?.copyWith(
            //         shape: const WidgetStatePropertyAll(CircleBorder()),
            //         side: const WidgetStatePropertyAll(
            //             BorderSide(width: 2, color: Palette.primary))),
            //     onPressed: () {},
            //     icon: Image.asset(LocalIcons.notification, height: 25)),
          ],
        ),
      ))),
    );
  }
}
