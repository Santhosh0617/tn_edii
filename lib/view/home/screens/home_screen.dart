import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(SizeUnit.lg), children: [
      const Heading('Popular Courses'),
      const CourseTypesTile(),
      const HeightFull(),
      Row(
        children: [
          Container(
            height: 200,
            width: 300,
            clipBehavior: Clip.antiAlias,
            decoration: ThemeGuide.cardDecoration(),
            child: Column(children: [
              Expanded(
                child: Container(color: Palette.dark),
              ),
              const TextCustom(
                'Graphic Design Advanced',
                size: 16,
                fontWeight: FontWeight.w700,
              ),
              const TextCustom(
                'PT-0091',
                fontWeight: FontWeight.bold,
              ),
            ]),
          ),
        ],
      ),
    ]);
  }
}
