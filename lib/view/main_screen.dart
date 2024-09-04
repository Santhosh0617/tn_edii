import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/repositories/course_repository.dart';
import 'package:tn_edii/repositories/training_repository.dart';
import 'package:tn_edii/repositories/user_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) => init());
    super.initState();
  }

  void init() {
    TrainingRepository().getTrainings(context);
    UserRepository().getUsers(context);
    CourseRepository().getRegisteresCourses(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: widget.child,
      bottomBar: const BottomNavBar(),
    );
  }
}
