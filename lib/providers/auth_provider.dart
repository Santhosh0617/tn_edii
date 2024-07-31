import 'package:flutter/material.dart';
import 'package:tn_edii/models/user.dart';

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

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    
    notifyListeners();
  }
}
