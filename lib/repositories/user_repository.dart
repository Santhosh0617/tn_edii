import 'package:flutter/material.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/repositories/auth_repository.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class UserRepository {
  String prefix = 'users';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> updateUser(
      BuildContext context, Map<String, dynamic> body) async {
    userProvider.isLoading = true;
    ResponseData responseData =
        await _api.post(context, 'update/${authProvider.user?.id}', body: body);
    userProvider.isLoading = false;
    if (responseData.hasError) return false;
    logger.e(responseData.data);
    authProvider.user = User.fromJson(body);
    return true;
  }

  Future<bool> getUsers(BuildContext context) async {
    // userProvider.isLoading = true;
    // ResponseData responseData = await _api.get(context, 'userList/:1');
    // userProvider.isLoading = false;
    // if (responseData.hasError) return false;
    // logger.e(responseData.data);
    userProvider.users = User().fromJsonList(userdatas);

    return true;
  }
}

List userdatas = [
  {
    "id": 1,
    "name": "John Doe",
    "role": "mentor",
    "email": "johndoe@example.com",
    "phonenumber": "1234567890",
  },
  {
    "id": 1,
    "name": "Venkatesh",
    "role": "expert",
    "email": "venkat@example.com",
    "phonenumber": "1234567890",
  },
  {
    "id": 1,
    "name": "Santhosh",
    "role": "investor",
    "email": "santhosh@example.com",
    "phonenumber": "1234567890",
  },
  {
    "id": 1,
    "name": "Hari Haran",
    "role": "peer",
    "email": "hari@example.com",
    "phonenumber": "1234567890",
  },
];
