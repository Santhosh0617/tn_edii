import 'package:flutter/material.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/models/expense_type.dart';
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
    ResourceType(key: 'Ebooks', resource: 'E-Books', image: LocalImages.eBooks),
    ResourceType(key: 'tools', resource: 'Tools', image: LocalImages.tools),
  ];

  List<ExpenseType> expenseTypes = [
    ExpenseType(id: 1, expense: 'Experts', image: LocalImages.articles),
    ExpenseType(id: 2, expense: 'Mentors', image: LocalImages.videos),
    ExpenseType(id: 3, expense: 'Investors', image: LocalImages.eBooks),
    ExpenseType(id: 4, expense: 'Peers', image: LocalImages.tools),
  ];
}
