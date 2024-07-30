import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(LocalImages.empty),
            TextCustom(
              title,
            ),
            // const HeightFull(multiplier: 6),
          ],
        ),
      ),
      ListView(
        shrinkWrap: true,
      ),
    ]);
  }
}
