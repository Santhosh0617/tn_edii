import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/repositories/auth_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List profileList(BuildContext context) => [
      {
        "id": 1,
        "name": "Edit Profile",
        "image": "assets/icons/my_enroll.png",
        "ontap": () => context.push(Routes.editProfile),
      },
      // {
    //   "id": 2,
      //   "name": "View Profile",
      //   "image": "assets/icons/my_enroll.png",
      //   "ontap": () {},
      // },
      {
        "id": 4,
        "name": "Privacy Policy",
        "image": "assets/icons/privacy.png",
        "ontap": () => context.push(Routes.privacy),
      },
      {
        "id": 5,
        "name": "App Info",
        "image": "assets/icons/app_info.png",
        "ontap": () => context.push(Routes.appInfo)
      },
      {
        "id": 6,
        "name": "Feedback & Support",
        "image": "assets/icons/home_icons/resources.png",
        "ontap": () => context.push(Routes.feedback)
      },
      {
        "id": 7,
        "name": "Invite Friends",
        "image": "assets/icons/invite_friends.png",
        "ontap": () => Share.share(
            'check out the EDII-TN application, ${AppStrings.playstoreUrl}')
      },
      {
        "id": 8,
        "name": "Logout",
        "image": "assets/icons/Stroke 1.png",
        "ontap": () => AuthRepository().logout(context)
      },
    ];

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List data = profileList(context);
    return CustomScaffold(
      isStackedAppBar: false,
      appBar:
          const AppBarCommon(automaticLeadingImplies: false, title: "Profile"),
      body: Column(
        children: [
          const HeightFull(),
          Stack(
            alignment: const Alignment(0, -1.1),
            children: [
              Container(
                padding: const EdgeInsets.all(SizeUnit.lg),
                margin: const EdgeInsets.all(SizeUnit.lg),
                decoration: ThemeGuide.cardDecoration(),
                child: Column(children: [
                  const HeightFull(multiplier: 3),
                  ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Map profileDetails = data[index];
                        return ProfileListText(
                          text: profileDetails["name"],
                          image: profileDetails["image"],
                          data: profileDetails['ontap'],
                          isLast: index == data.length - 1,
                        );
                      })
                ]),
              ),
              Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(2),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Palette.primary),
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const NetworkImageCustom(logo: "")),
              )
            ],
          ),
        ],
      ),
    );
  }

  void handleProfileTap(BuildContext context, Map profileDetails) {
    if (profileDetails["id"] == 7) {
      Share.share('check out my App https://Playstore.com',
          subject: 'Look what I made!');
    } else {
      context.push(profileDetails["ontap"]);
    }
  }
}

class ProfileListText extends StatelessWidget {
  const ProfileListText({
    super.key,
    required this.text,
    required this.image,
    required this.data,
    this.isLast = false,
  });
  final String text, image;
  final bool isLast;
  final Function() data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: data,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Image.asset(image, height: 24),
              const WidthFull(),
              TextCustom(text, size: 16, fontWeight: FontWeight.bold)
            ]),
            const Icon(Icons.arrow_forward_ios)
          ]),
        ),
        if (!isLast) const HeightFull(multiplier: 2),
      ],
    );
  }
}
