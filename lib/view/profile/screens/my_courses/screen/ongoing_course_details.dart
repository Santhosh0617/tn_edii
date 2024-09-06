import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/curriculum.dart';
import 'package:tn_edii/models/my_course.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/repositories/course_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/view/course_screen/widget/curriculum_list.dart';
import 'package:tn_edii/view/course_screen/widget/curriculum_tile.dart';
import 'package:tn_edii/view/profile/screens/my_courses/widget/completed_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class OnGoingCourseDetails extends StatefulWidget {
  const OnGoingCourseDetails({super.key});

  @override
  State<OnGoingCourseDetails> createState() => _OnGoingCourseDetailsState();
}

class _OnGoingCourseDetailsState extends State<OnGoingCourseDetails> {
  final TextEditingController searchCont = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => init());
    super.initState();
  }

  MyCourse? course;
  void init() {
    course = GoRouterState.of(context).extra as MyCourse?;
    if (course?.trainingId == null) return;
    CourseRepository().getCourseCurriculum(context, course!.trainingId!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.bg,
      appBar: const AppBarCommon(
          automaticLeadingImplies: true, title: "My Courses", isText: false),
      bottomBar: Padding(
          padding: EdgeInsets.all(SizeUnit.lg),
          child: ButtonPrimary(
              onPressed: () =>
                  commonDialog(context, CourseCompletedDialog(course: course)),
              label: 'Continue')),
      body: ListView(
        padding: EdgeInsets.all(SizeUnit.lg),
        children: const [
          CurriculumList(canOpenVideo: true),
        ],
      ),

      //  ??
      // Column(
      //   children: const [
      //     Expanded(
      //       child: CurriculumList(),
      //     ),
      //   ],
      // )
    );
  }
}

Future<void> openExApp(url) async {
  Uri uri = url.runtimeType == String ? Uri.parse(url) : url;
  if (!await launchUrl(uri)) {
    throw 'Could not launch $url';
  }
}
