import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/repositories/course_repository.dart';
import 'package:tn_edii/repositories/training_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';
import 'package:tn_edii/view/course_screen/widget/course_details_container.dart';
import 'dart:math' as math;

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  Training get training => GoRouterState.of(context).extra as Training;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => init());
    super.initState();
  }

  void init() {
    if (training.id == null) return;
    // TrainingRepository().getTraining(context, training.id!);
    CourseRepository().getCourseCurriculum(context, training.id!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      bottomBar: Consumer<TrainingProvider>(
        builder: (context, value, child) {
          return Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: ButtonPrimary(
                    label:
                        "Enroll Course - ${training.feeAmount.toString().money()}/-",
                    isLoading: value.isLoading,
                    onPressed: enRoll),
              ),
            ),
          ]);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                  height: 350,
                  width: context.widthFull(),
                  color: Colors.red,
                  child: NetworkImageCustom(
                      logo: '${training.id}.jpeg'
                          .toImageUrl(subFolder: 'training_images'))),
              SafeArea(
                  child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new))),
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
                  const TextCustom(
                    "Instructor",
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: Palette.dark,
                  ),
                  const HeightFull(),
                  ListTile(
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.push(Routes.mentorProfile, extra: training);
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: NetworkImageCustom(
                        logo: training.user?.profilePicture ?? '',
                        placeholderImage: LocalImages.profilePlaceholder),
                    title: TextCustom(training.user?.name ?? "-",
                        size: 16, fontWeight: FontWeight.w800),
                    subtitle: TextCustom(training.user?.role ?? "-",
                        size: 14, fontWeight: FontWeight.w600),
                    // trailing: Icon(Icons.message),
                  ),
                  const HeightFull(),
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

                  //button
                  // Consumer<TrainingProvider>(
                  //   builder: (context, value, child) => Row(
                  //     children: [
                  //       Expanded(
                  //         child: ButtonPrimary(
                  //             label:
                  //                 "Enroll Course - ${training.feeAmount.toString().money()}/-",
                  //             isLoading: value.isLoading,
                  //             onPressed: enRoll),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  //reviews
                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //      const TextCustom("Reviews",size: 16,fontWeight: FontWeight.w700,color: Palette.dark,),
                  //      InkWell(
                  //       highlightColor: Colors.transparent,
                  //       splashColor: Colors.transparent,
                  //       onTap: () => context.push(Routes.reviewScreen),
                  //        child: const Row(
                  //         children: [
                  //           TextCustom("See All",fontWeight: FontWeight.w800,color: Palette.red,),
                  //           Icon(Icons.arrow_forward_ios,color: Palette.red,size: 16,)
                  //         ],
                  //        ),
                  //      )
                  //   ],
                  // ),
                  // // const HeightFull(),
                  // HeightHalf(),
                  // ListView.separated(
                  //   padding: EdgeInsets.zero,
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context,index){
                  // return ReviewsCard();
                  // }, separatorBuilder: (context,index){
                  //   return HeightFull();
                  // }, itemCount: 2),
                  // const HeightFull(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void enRoll() async {
    bool val = await context.push(Routes.registerProfile, extra: true) ?? false;
    if (training.id == null || !val) return;
    int paymentId = math.Random().nextInt(1000) + 10000;
    Map<String, dynamic> body = {
      'userId': authProvider.user?.id,
      'is_payment_done': true,
      'payment_id': paymentId
    };
    bool isRegistered = await TrainingRepository()
        .registerTraining(context, training.id!, body);
    if (!isRegistered) return;
    context.pop();
  }
}
