import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/services/route/router.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      // height: 110,
      // width: 110,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Palette.pureWhite,
          border: Border.all(color: Palette.yellow, width: 5),
          shape: BoxShape.circle),
      child: InkWell(
        onTap: () {
          isLoggedIn = true;
          // context.push(Routes.imageFullview, extra: img.toImageUrl("profiles"));
        },
        child: Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Palette.pureWhite),
            child: img.isEmpty
                ? Image.asset(LocalImages.placeholder)
                : const NetworkImageCustom(
                    logo: '',
                  )),
      ),
    );
  }
}
