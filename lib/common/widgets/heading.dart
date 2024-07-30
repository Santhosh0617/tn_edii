import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';

class Heading extends StatelessWidget {
  const Heading(
    this.value, {
    super.key,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextCustom(value,
            color: Palette.dark, fontWeight: FontWeight.w700, size: 16),
      ),
      const WidthFull(),
      TextButton(
        onPressed: () {},
        child: const Row(
          children: [
            TextCustom('SEE ALL'),
            Icon(Icons.chevron_right),
          ],
        ),
      )
    ]);
  }
}
