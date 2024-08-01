import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/resource_type.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class ResourceTypesTile extends StatelessWidget {
  const ResourceTypesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(resourceProvider.resourceTypes.length, (i) {
            ResourceType resourceType = resourceProvider.resourceTypes[i];
            return InkWell(
              onTap: () {
                context.push(Routes.resourcesDetail,
                    extra: resourceType.resource);
              },
              child: Container(
                  width: 100,
                  margin: EdgeInsets.only(left: i == 0 ? 0 : SizeUnit.lg),
                  child: Column(children: [
                    ClipRRect(
                        borderRadius: ThemeGuide.borderRadius(),
                        child: Image.asset(resourceType.image)),
                    const HeightHalf(),
                    TextCustom(
                      resourceType.resource,
                      fontWeight: FontWeight.w700,
                    )
                  ])),
            );
          }),
        ));
  }
}
