import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/reviews/widget/reviews_card_widget.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: "Resources",
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(SizeUnit.xlg),
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ReviewsCard();
              },
              separatorBuilder: (context, index) {
                return HeightFull();
              },
              itemCount: 10)
        ],
      ),
    );
  }
}
