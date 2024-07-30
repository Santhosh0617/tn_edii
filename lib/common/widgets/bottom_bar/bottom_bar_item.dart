import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar_data.dart';
import 'package:tn_edii/common/widgets/image_circle.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/Palette.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomBarItem extends StatelessWidget {
  BottomBarItem({super.key, required this.data});
  final BottomBarDatum data;

  @override
  Widget build(BuildContext context) {
    isSelected = GoRouterState.of(context).uri.path == data.route;
    return InkWell(
      onTap: () => context.go(data.route),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
            vertical: SizeUnit.sm * .5,
            horizontal: isSelected ? SizeUnit.lg : SizeUnit.md),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        duration: const Duration(milliseconds: 400),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const HeightHalf(),
          Icon(
            Icons.circle,
            size: 8,
            color: isSelected ? Palette.primary : Colors.transparent,
          ),
        ]),
      ),
    );
  }

  Widget image(String image) =>
      Image.asset(image, color: iconColor, height: 30, width: 30);

  Widget networkImage(String image) => ImageCircle(image: image, radius: 18);

  bool isSelected = false;

  Color? get color => isSelected ? Palette.pureWhite : null;
  Color? get iconColor => isSelected ? Palette.dark : Palette.secondary;
}
