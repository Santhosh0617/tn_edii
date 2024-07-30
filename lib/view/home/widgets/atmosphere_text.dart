import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';

class AtmosphereText extends StatelessWidget {
  const AtmosphereText({
    super.key,
    required this.icon,
    required this.head,
    required this.value,
  });

  final String icon;
  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(icon, width: 20),
              const WidthHalf(),
              TextCustom(head,
                  color: Palette.pureWhite,
                  fontWeight: FontWeight.w700,
                  size: 14),
              const WidthFull(),
            ],
          ),
        ),
        Container(
          height: 20,
          width: 1,
          color: Palette.pureWhite,
        ),
        Expanded(
          child: Row(
            children: [
              const WidthFull(),
              TextCustom(value,
                  color: Palette.pureWhite,
                  fontWeight: FontWeight.w700,
                  size: 14),
            ],
          ),
        ),
      ],
    );
  }
}
