import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String val) {
    _accessToken = val;
    notifyListeners();
  }
}
