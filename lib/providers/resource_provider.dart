import 'package:flutter/material.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/models/articles_model.dart';
import 'package:tn_edii/models/expense_type.dart';
import 'package:tn_edii/models/resource_model.dart';
import 'package:tn_edii/models/resource_type.dart';

class ResourceProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  List<ResourceType> resourceTypes = [
    ResourceType(
        key: 'articles', resource: 'Articles', image: LocalImages.articles),
    ResourceType(key: 'videos', resource: 'Videos', image: LocalImages.videos),
    ResourceType(key: 'ebooks', resource: 'E-Books', image: LocalImages.eBooks),
    ResourceType(key: 'tools', resource: 'Tools', image: LocalImages.tools),
  ];

  List<ExpenseType> expenseTypes = [
    ExpenseType(role: 'expert', expense: 'Experts', image: LocalImages.experts),
    ExpenseType(role: 'mentor', expense: 'Mentors', image: LocalImages.mentors),
    ExpenseType(
        role: 'investor', expense: 'Investors', image: LocalImages.investors),
  ];

 

  List<Resourses> _resourseData = [];
  List<Resourses> get resourseData => _resourseData;
  set resourseData(List<Resourses> data) {
    _resourseData = data;
    notifyListeners();
  }
  List<ArticlesModel> _articleData = [];
  List<ArticlesModel> get articleData => _articleData;
  set articleData(List<ArticlesModel> data) {
    _articleData = data;
    notifyListeners();
  }
}
