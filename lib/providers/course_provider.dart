import 'package:flutter/material.dart';
import 'package:tn_edii/models/course_type.dart';

class CourseProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  CourseType _selectedCourseType = courseTypes.first;
  CourseType get selectedCourseType => _selectedCourseType;
  set selectedCourseType(CourseType type) {
    _selectedCourseType = type;
    notifyListeners();
  }
}

List<CourseType> courseTypes = [
  CourseType(type: 'All', id: 1),
  CourseType(type: 'Free Courses', id: 2),
  CourseType(type: 'Paid Courses', id: 3),
];
