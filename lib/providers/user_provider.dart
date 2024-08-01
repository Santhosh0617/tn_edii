import 'package:flutter/material.dart';
import 'package:tn_edii/models/user.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  List<User> _users = [];
  List<User> get users => _users;
  set users(List<User> users) {
    _users = users;
    notifyListeners();
  }
}
