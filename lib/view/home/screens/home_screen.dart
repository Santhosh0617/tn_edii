import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_main.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/home/widgets/home_trainings_list.dart';
import 'package:tn_edii/view/home/widgets/resource_types_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void changeIndex(int index, CarouselPageChangedReason reson) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    logger.e(authProvider.accessToken);
    return CustomScaffold(
      appBar: const AppBarMain(),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                    itemCount: banner.length,
                    itemBuilder: (context, index, realIndex) => Container(
                        decoration: ThemeGuide.cardDecoration(),
                        // margin:
                        //     const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          banner[index],
                          fit: BoxFit.cover,
                        )),
                    options: CarouselOptions(
                        onPageChanged: changeIndex,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 150)),
                Padding(
                  padding: const EdgeInsets.only(bottom: SizeUnit.sm),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          banner.length,
                          (i) => Container(
                                height: 8,
                                width: selectedIndex == i ? 18 : 8,
                                margin: const EdgeInsets.only(right: 6),
                                decoration: ThemeGuide.cardDecoration(
                                    color: selectedIndex == i
                                        ? null
                                        : Palette.grey),
                              ))),
                )
              ],
            ),
            const HeightFull(),
            Heading('Popular Trainings', onSeeAll: () {
              context.push(Routes.training);
            }),
            const TrainingsTypesTile(),
            const HeightFull(),
            const HomeTrainingsList(),
            const Heading('Entrepreneurship Resources'),
            const ResourceTypesTile()
          ]),
    );
  }

  List banner = [
    'assets/images/banner_images/banner1.jpeg',
    'assets/images/banner_images/banner2.jpeg',
    'assets/images/banner_images/banner3.jpeg',
    'assets/images/banner_images/banner4.jpeg',
    'assets/images/banner_images/banner5.jpeg',
  ];
}
