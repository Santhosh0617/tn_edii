import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/models/curriculum.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';

class CurriculumListTile extends StatelessWidget {
  const CurriculumListTile({
    super.key,
    required this.video,
    required this.index,
    this.openVideo = false,
  });
  final Video video;
  final int index;
  final bool openVideo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: openVideo
          ? () => context.push(Routes.courseVedio, extra: video.path ?? '')
          : null,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Palette.wavyBlueBorder, width: 2),
            color: Palette.wavyBlue),
        child: Center(
            child: TextCustom(
          "${index + 1}",
          size: 14,
          fontWeight: FontWeight.w800,
        )),
      ),
      title: TextCustom(
        video.title ?? '',
        // "Why Using Graphic De huoiefwugeufgeur ugfiurg iu",
        size: 16,
        fontWeight: FontWeight.w600,
        maxLines: 1,
      ),
      subtitle: TextCustom(
        '${video.minutes ?? '0'} Mins',
        // "15 Mins",
        size: 12,
        fontWeight: FontWeight.w600,
        color: Palette.grey,
      ),
      trailing: (video.path ?? '').isEmpty
          ? SizedBox()
          : Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.primary,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20,
              ),
            ),
    );
  }
}
