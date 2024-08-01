import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'package:tn_edii/view/single_course_screen/widget/course_details_container.dart';

class SingleCourseDetail extends StatefulWidget {
  const SingleCourseDetail({super.key});

  @override
  State<SingleCourseDetail> createState() => _SingleCourseDetailState();
}

class _SingleCourseDetailState extends State<SingleCourseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 350,
                    width: context.widthFull(),
                    color: Colors.red,
                    child: Image.asset(
                      LocalImages.sampleImg,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 70,
                    left: 10,
                    child: InkWell(
                      onTap: () => context.pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CourseDetailsContainer(),
                ),
                Positioned(
                  top: 315,
                  left: 290,
                  child: InkWell(
                    onTap: () => logger.f("vedio button"),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.primary,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const HeightFull(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextCustom("Instructor",
                      size: 16, fontWeight: FontWeight.w700),
                  const HeightFull(),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                        maxRadius: 35,
                        backgroundImage: AssetImage(LocalImages.sampleImg)),
                    title: TextCustom("name",
                        size: 16, fontWeight: FontWeight.w800),
                    subtitle: TextCustom("Graphic Design",
                        size: 14, fontWeight: FontWeight.w600),
                    trailing: Icon(Icons.message),
                  ),
                  const HeightFull(
                    multiplier: 2,
                  ),
                  const TextCustom(
                    "What You’ll Get",
                    size: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  const HeightFull(),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(
                            Icons.access_alarm,
                            size: 30,
                          ),
                          title: TextCustom(
                            "name",
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: SizeUnit.sm,
                        );
                      },
                      itemCount: 7),
                  const HeightFull(
                    multiplier: 2,
                  ),
                  LengthButton(
                    label: "Enroll Course - 499/-",
                    onTap: enRoll,
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
    logger.d("enroll");
  }
}
