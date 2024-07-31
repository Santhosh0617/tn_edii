import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/services/route/router.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class AuthRepository {
  String prefix = 'auth';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> login(BuildContext context, Map<String, dynamic> params) async {
    authProvider.isLoading = true;
    ResponseData responseData = await _api.post(context, 'login', body: params);
    authProvider.isLoading = false;
    if (responseData.hasError) return false;
    saveCredentials(responseData.data);
    navigateHome(context);
    return true;
  }

  Future<bool> register(
      BuildContext context, Map<String, dynamic> params) async {
    authProvider.isLoading = true;
    ResponseData responseData =
        await APIService().post(context, 'user/register', body: params);
    authProvider.isLoading = false;
    if (responseData.hasError) return false;
    saveCredentials(responseData.data);
    navigateHome(context);
    return true;
  }

  Future<bool> logout(BuildContext context) async {
    authProvider.isLoading = true;
    await Future.delayed(const Duration(milliseconds: 500));
    navigateLogin(context);
    clearCredentials();
    authProvider.isLoading = false;
    return true;
  }

  void saveCredentials(Map data) {
    authProvider.accessToken = data['token'] ?? "";
    authProvider.user = User.fromJson(data['data'] ?? {});
  }

  void clearCredentials() {
    authProvider.accessToken = "";
    authProvider.user = null;
  }

  void navigateHome(BuildContext context) {
    isLoggedIn = true;
    context.go(Routes.home);
  }

  void navigateLogin(BuildContext context) {
    isLoggedIn = false;
    context.go(Routes.login);
  }
}
