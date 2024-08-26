import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';
import 'package:tn_edii/view/course_screen/widget/course_details_container.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  Training get training => GoRouterState.of(context).extra as Training;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                  height: 350,
                  width: context.widthFull(),
                  color: Colors.red,
                  child: NetworkImageCustom(
                      logo:
                          '${AppStrings.apiUrl}users/uploads/training_images/${training.id}.jpeg')),
              SafeArea(
                  child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back))),
              Align(
                alignment: Alignment.bottomCenter,
                child: CourseDetailsContainer(training: training),
              ),
              // Positioned(
              //   top: 315,
              //   right: 50,
              //   child: IconButton.filled(
              //     onPressed: () {},
              //     icon: const Icon(Icons.play_arrow,
              //         color: Colors.white, size: 30),
              //   ),
              // )
            ]),
            const HeightFull(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextCustom("Instructor",
                      size: 16, fontWeight: FontWeight.w700),
                  const HeightFull(),
                  ListTile(
                    onTap: () {
                      context.push(Routes.mentorProfile, extra: training);
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: const NetworkImageCustom(
                        logo: '',
                        placeholderImage: LocalImages.profilePlaceholder),
                    title: TextCustom(training.user?.name ?? "-",
                        size: 16, fontWeight: FontWeight.w800),
                    subtitle: TextCustom(training.user?.role ?? "-",
                        size: 14, fontWeight: FontWeight.w600),
                    // trailing: Icon(Icons.message),
                  ),
                  const HeightFull(
                    multiplier: 2,
                  ),
                  // const TextCustom(
                  //   "What You’ll Get",
                  //   size: 16,
                  //   fontWeight: FontWeight.w800,
                  // ),
                  // const HeightFull(),
                  // ListView.separated(
                  //     padding: EdgeInsets.zero,
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemBuilder: (context, index) {
                  //       return const ListTile(
                  //         contentPadding: EdgeInsets.zero,
                  //         leading: Icon(
                  //           Icons.access_alarm,
                  //           size: 30,
                  //         ),
                  //         title: TextCustom(
                  //           "name",
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return const SizedBox(
                  //         height: SizeUnit.sm,
                  //       );
                  //     },
                  //     itemCount: 7),
                  // const HeightFull(
                  //   multiplier: 2,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonPrimary(
                            label:
                                "Enroll Course - ${training.feeAmount.toString().money()}/-",
                            onPressed: enRoll),
                      ),
                    ],
                  ),
                  const HeightFull(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void enRoll() {
    context.push(Routes.registerProfile, extra: true);
  }
}
