import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class HomeTrainingsTile extends StatelessWidget {
  const HomeTrainingsTile({
    super.key,
    required this.course,
  });
  final Training course;
  @override
  Widget build(BuildContext context) {
    String price = course.feeAmount.toString();
    price = price == '0' ? 'Free' : price.money();
    return Column(
      children: [
        InkWell(
          onTap: () => context.push(Routes.courseDetail, extra: course),
          child: Container(
            width: 300,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: ThemeGuide.cardDecoration(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Container(
                  width: 300,
                  color: const Color(0xffCCCCCC),
                  child: NetworkImageCustom(
                      logo: '${course.id}.jpeg'
                          .toImageUrl(subFolder: 'training_images')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeUnit.lg, vertical: SizeUnit.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      course.title ?? '',
                      size: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    TextCustom(
                      price,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
