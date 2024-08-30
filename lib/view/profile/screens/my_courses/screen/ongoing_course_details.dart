import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/completed_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class OnGoingCourseDetails extends StatefulWidget {
  const OnGoingCourseDetails({super.key});

  @override
  State<OnGoingCourseDetails> createState() => _OnGoingCourseDetailsState();
}

class _OnGoingCourseDetailsState extends State<OnGoingCourseDetails> {
  final TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        color: Palette.bg,
        appBar: const AppBarCommon(
            automaticLeadingImplies: true, title: "My Courses", isText: false),
        bottomBar: Padding(
            padding: EdgeInsets.all(SizeUnit.lg),
            child: ButtonPrimary(
                onPressed: () =>
                    commonDialog(context, const CourseCompletedDialog()),
                label: 'Continue')),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeUnit.lg, vertical: SizeUnit.lg),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(SizeUnit.lg),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Palette.pureWhite),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextCustom("Section ${index + 1} -",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.dark),
                                  const TextCustom(" Title",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Palette.primary),
                                ],
                              ),
                              const TextCustom("125 Min",
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.primary)
                            ],
                          ),
                          HeightHalf(),
                          ...List.generate(2, (index) {
                            return Column(
                              children: [
                                index!=0?Divider(color: Palette.bg,thickness: 1.5,):SizedBox.shrink(),
                                ListTile(
                                  onTap: () => openExApp("https://www.youtube.com/watch?v=6LD30ChPsSs&list=RDQ6mcDZui71I&index=13"),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 0),
                                  leading: CircleAvatar(
                                    backgroundColor: Palette.bg,
                                    child: TextCustom(
                                      "${index + 1}",
                                      size: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Palette.dark,
                                    ),
                                  ),
                                  title: TextCustom(
                                    "Why Using 3D Blender",
                                    size: 15,
                                    maxLines: 1,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.dark,
                                  ),
                                  subtitle: TextCustom(
                                        "15 Mins",
                                        size: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Palette.grey,
                                      ),
                                      trailing: Image.asset(
                                        "assets/icons/youtube.png",
                                        width: 22,
                                      ),
                                ),
                              ],
                            );
                          })

                          
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const HeightFull();
                  },
                  itemCount: 25),
            ),
          ],
        )
        );
  }


}
  Future<void> openExApp(url) async {
  Uri uri = url.runtimeType == String ? Uri.parse(url) : url;
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}