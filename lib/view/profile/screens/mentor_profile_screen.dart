import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/view/profile/widget/profile_circle_container.dart';

class MentorProfileScreen extends StatefulWidget {
  const MentorProfileScreen({super.key});

  @override
  State<MentorProfileScreen> createState() => _MentorProfileScreenState();
}

class _MentorProfileScreenState extends State<MentorProfileScreen> {
  Training get training => GoRouterState.of(context).extra as Training;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: const AppBarCommon(
        automaticLeadingImplies: true,
        title: "Mentor Profile",
        isText: false,
      ),
      body: ListView(padding: EdgeInsets.zero, children: [
        const HeightFull(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
          child: Column(
            children: [
              Container(
                width: context.widthFull(),
                padding: const EdgeInsets.all(SizeUnit.lg),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Palette.wavyBlue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 160,
                        width: 160,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.grey.withOpacity(.5)),
                        child: Container(
                            clipBehavior: Clip.hardEdge,
                            height: 140,
                            width: 140,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const ProfileCircle(img: "")),
                      ),
                    ),
                    const HeightFull(),
                    Center(
                      child: TextCustom(
                        training.user?.name ?? "-",
                        color: Palette.dark,
                        fontWeight: FontWeight.w700,
                        size: 16,
                      ),
                    ),
                    const HeightHalf(),
                    Center(
                      child: TextCustom(training.user?.email ?? "-",
                          color: Palette.grey,
                          fontWeight: FontWeight.w400,
                          size: 12),
                    ),
                    const HeightHalf(),
                    Center(
                      child: TextCustom(training.user?.phonenumber ?? "-",
                          fontWeight: FontWeight.w400,
                          size: 12,
                          color: Palette.grey),
                    ),
                    // const HeightFull(multiplier: 2,),
                    // TextCustom("About",size: 16,fontWeight: FontWeight.w700,),
                    const HeightFull(),
                    // const Center(
                    //     child: TextCustom(
                    //   "About",
                    //   size: 16,
                    //   fontWeight: FontWeight.w800,
                    // )),
                    Divider(color: Palette.grey.withOpacity(.2),),

                    const HeightFull(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: NameCard(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Role",
                            subtitle: training.user?.role ?? "-",
                            titleSize: 16,
                            subtitleSize: 14,
                            titlecolor: Palette.dark,
                            subtitlecolor: Palette.grey,
                          ),
                        ),
                        Expanded(
                          child: NameCard(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Location",
                            subtitle: training.user?.location ?? "-",
                            titleSize: 16,
                            subtitleSize: 14,
                            titlecolor: Palette.dark,
                            subtitlecolor: Palette.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Palette.grey.withOpacity(.2),),
                    // const HeightFull(),
                    // const Center(
                    //     child: TextCustom(
                    //   "Qualification",
                    //   size: 16,
                    //   fontWeight: FontWeight.w800,
                    // )),
                    const HeightFull(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: NameCard(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: "Degree",
                            subtitle: training.user?.qualification ?? "-",
                            titleSize: 16,
                            subtitleSize: 14,
                            titlecolor: Palette.dark,
                            subtitlecolor: Palette.grey,
                          ),
                        ),
                        Expanded(
                          child: NameCard(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            title: "University",
                            subtitle: training.user?.nameOfUniversity ?? "-",
                            titleSize: 16,
                            subtitleSize: 14,
                            titlecolor: Palette.dark,
                            subtitlecolor: Palette.grey,
                          ),
                        ),
                        Expanded(
                          child: NameCard(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            title: "Year",
                            subtitle: training.user?.yearOfCompletion ?? "-",
                            titleSize: 16,
                            subtitleSize: 14,
                            titlecolor: Palette.dark,
                            subtitlecolor: Palette.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Palette.grey.withOpacity(.2),)
                  ],
                ),
              ),
              const HeightFull(),
            ],
          ),
        ),
      ]),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     TextCustom("Name: ${training.user?.name ?? '-'}"),
      //     TextCustom("Role: ${training.user?.role ?? '-'}"),
      //     TextCustom("Fee: ${training.feeAmount.toString()}"),
      //   ],
      // ),
    );
  }
}
