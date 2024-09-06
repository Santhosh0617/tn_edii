import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/articles_model.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class ResourceCardTile extends StatefulWidget {
  const ResourceCardTile({super.key, required this.data});
  final ArticlesModel data;

  @override
  State<ResourceCardTile> createState() => _ResourceCardTileState();
}

class _ResourceCardTileState extends State<ResourceCardTile> {
  @override
  Widget build(BuildContext context) {
    logger.i(widget.data.toJson());
    return InkWell(
      onTap: () {
        context.push(Routes.pdfView, extra: widget.data.path);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 128,
        width: context.widthFull(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Palette.pureWhite),
        child: Row(
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                height: 128,
                width: 136,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        bottomLeft: Radius.circular(22)),
                    color: Palette.grey.withOpacity(.2)),
                child: Image.asset(LocalImages.logo, fit: BoxFit.cover)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(SizeUnit.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      widget.data.name ?? "-",
                      size: 14,
                      fontWeight: FontWeight.w800,
                      maxLines: 1,
                      color: Palette.dark,
                    ),
                    const HeightHalf(),
                    TextCustom(
                      widget.data.content ?? "-",
                      size: 13,
                      fontWeight: FontWeight.w500,
                      color: Palette.grey,
                      maxLines: 2,
                    ),
                    const HeightHalf(),
                    Row(
                      children: [
                        Icon(Icons.picture_as_pdf,
                            color: Palette.grey, size: 20),
                        WidthHalf(),
                        TextCustom(
                          widget.data.path ?? "-",
                          size: 13,
                          fontWeight: FontWeight.w500,
                          color: Palette.grey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
