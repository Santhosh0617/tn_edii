import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/curriculum.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/course_screen/widget/curriculum_tile.dart';

class CurriculumList extends StatelessWidget {
  const CurriculumList({
    super.key,
    this.canOpenVideo = false,
  });
  final bool canOpenVideo;

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, value, child) {
        return ListView.separated(
          itemCount: value.curriculums.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(),
          itemBuilder: (context, index) {
            Curriculum curriculum = value.curriculums[index];
            List<Video> videos = curriculum.videos ?? [];
            return Container(
              padding: const EdgeInsets.all(SizeUnit.lg),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Palette.grey.withOpacity(.2)),
                  color: Palette.pureWhite),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextCustom(curriculum.section ?? '',
                              // "Section ${index + 1} -",
                              size: 14,
                              fontWeight: FontWeight.w600,
                              color: Palette.dark),
                          // const TextCustom(" Title",
                          //     size: 14,
                          //     fontWeight: FontWeight.w600,
                          //     color: Palette.primary),
                        ],
                      ),
                      TextCustom("${curriculum.totalMins} Mins",
                          size: 14,
                          fontWeight: FontWeight.w600,
                          color: Palette.primary)
                    ],
                  ),
                  HeightHalf(),
                  ...List.generate(videos.length, (i) {
                    return Column(
                      children: [
                        i != 0
                            ? Divider(
                                color: Palette.grey.withOpacity(.2),
                                thickness: 1.5)
                            : SizedBox.shrink(),
                        CurriculumListTile(
                            openVideo: canOpenVideo, index: i, video: videos[i])
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
        );
      },
    );
  }
}
