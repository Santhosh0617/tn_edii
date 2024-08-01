import 'package:flutter/material.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/models/resource_type.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
