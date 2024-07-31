import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/services/storage/storage_constants.dart';

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
    securedStorage.write(key: StorageConstants.accessToken, value: val);
    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    securedStorage.write(
        key: StorageConstants.user, value: jsonEncode(user?.toJson() ?? {}));
    notifyListeners();
  }
}
