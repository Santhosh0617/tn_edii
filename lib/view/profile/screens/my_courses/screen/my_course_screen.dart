import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/assets/local_icons.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/completed_tile.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/ongoing_tile.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/tab_bar_tile_widget.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  final TextEditingController searchCont=TextEditingController();
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List titles = [
    {"title": "Completed"},
    {"title": "Ongoing"},
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      appBar: const AppBarCommon(
        automaticLeadingImplies: true,
        title: "My Courses",
        isText: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SizeUnit.lg),
        child: Column(
          children: [
            TextFormFieldCustom(controller: searchCont, hint: "Search",),
            HeightFull(),
            Row(
                children: List.generate(
                    titles.length,
                    (index) => Expanded(
                          child: TabBarTile(
                              onTap: () =>
                                  setState(() => selectedIndex = index),
                              isSelected: selectedIndex == index,
                              title: titles[index]['title'],
                              isFirst: index == 0),
                        ))),
                        // HeightHalf(),
                        SizedBox(height: SizeUnit.sm,),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() => selectedIndex = value);
                  },
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return 
                    switch (selectedIndex) {
                      0 => const CompletedTile(),
                      _ => const OngoingTile(),
                    };
                  }),
            )
          ],
        ),
      ),
    );
  }
   void changeIndex(int i) {
    setState(() => selectedIndex = i);
  }
}


