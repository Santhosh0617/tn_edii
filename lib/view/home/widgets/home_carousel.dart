import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int selectedIndex = 0;

  void changeIndex(int index, CarouselPageChangedReason reson) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                            color: selectedIndex == i ? null : Palette.grey),
                      ))),
        )
      ],
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
