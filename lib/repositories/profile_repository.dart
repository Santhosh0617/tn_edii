import 'package:flutter/material.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class ProfileRepository {
  String prefix = 'users';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> updateUser(
      BuildContext context, Map<String, dynamic> body) async {
    profileProvider.isLoading = true;
    ResponseData responseData = await _api
        .post(context, 'update/:${authProvider.user?.id}', body: body);
    profileProvider.isLoading = false;
    if (responseData.hasError) return false;
    logger.e(responseData.data);
    authProvider.user = User.fromJson(body);
    return true;
  }
}
