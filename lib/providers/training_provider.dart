import 'package:flutter/material.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/models/course_type.dart';

class TrainingProvider extends ChangeNotifier {
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
    selectedTrainings = trainings.where(trainingCondition).toList();
    notifyListeners();
  }

  bool trainingCondition(Training e) {
    return selectedCourseType.id == 3
        ? e.feeAmount != 0
        : selectedCourseType.id == 2
            ? e.feeAmount == 0
            : true;
  }

  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;
  set trainings(List<Training> trainings) {
    _trainings = trainings;
    selectedTrainings = trainings;
    notifyListeners();
  }

  List<Training> _selectedTrainings = [];
  List<Training> get selectedTrainings => _selectedTrainings;
  set selectedTrainings(List<Training> selectedTrainings) {
    _selectedTrainings = selectedTrainings;
    notifyListeners();
  }
}

List<CourseType> courseTypes = [
  CourseType(type: 'All', id: 1),
  CourseType(type: 'Free Courses', id: 2),
  CourseType(type: 'Paid Courses', id: 3),
];
