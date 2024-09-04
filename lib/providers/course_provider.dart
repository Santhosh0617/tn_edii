import 'package:flutter/material.dart';
import 'package:tn_edii/models/curriculum.dart';
import 'package:tn_edii/models/my_course.dart';

class CourseProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  List<MyCourse> _myCourses = [];
  List<MyCourse> get myCourses => _myCourses;
  set myCourses(List<MyCourse> myCourses) {
    _myCourses = myCourses;
    notifyListeners();
  }

  List<MyCourse> _selectedMonthCourses = [];
  List<MyCourse> get selectedMonthCourses => _selectedMonthCourses;
  set selectedMonthCourses(List<MyCourse> selectedMonthCourses) {
    _selectedMonthCourses = selectedMonthCourses;
    notifyListeners();
  }

  List<Curriculum> _curriculums = [];
  List<Curriculum> get curriculums => _curriculums;
  set curriculums(List<Curriculum> curriculums) {
    _curriculums = curriculums;
    notifyListeners();
  }
}
