import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/heading.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/repositories/auth_repository.dart';
import 'package:tn_edii/view/home/widgets/course_types_tile.dart';
import 'package:tn_edii/view/home/widgets/home_course_list.dart';
import 'package:tn_edii/view/home/widgets/resource_types_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(vertical: SizeUnit.lg),
        children: [
          ButtonPrimary(
              onPressed: () => AuthRepository().logout(context),
              label: 'Logout'),
          const Heading('Popular Courses'),
          const CourseTypesTile(),
          const HeightFull(),
          const HomeCourseList(),
          const HeightFull(),
          const Heading('Entrepreneurship Resources'),
          const HeightFull(),
          const ResourceTypesTile()
        ]);
  }
}
