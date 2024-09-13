import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/course_screen/widget/curriculum_list.dart';

class CompletedCourseDetails extends StatefulWidget {
  const CompletedCourseDetails({super.key});

  @override
  State<CompletedCourseDetails> createState() => _CompletedCourseDetailsState();
}

class _CompletedCourseDetailsState extends State<CompletedCourseDetails> {
  final TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        color: Palette.bg,
        appBar: const AppBarCommon(
            automaticLeadingImplies: true, title: "My Courses", isText: false),
        body: ListView(
          padding: EdgeInsets.all(SizeUnit.lg),
          children: const [
            CurriculumList(canOpenVideo: true),
          ],
        ));
  }
}
