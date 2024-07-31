import 'package:dio/dio.dart';
import 'package:tn_edii/constants/keys.dart';

import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/services/route/router.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/services/storage/storage_constants.dart';
import 'package:tn_edii/utilities/message.dart';

class APIHelper {
  ResponseData httpErrorHandle({required Response? response}) {
    Map<String, dynamic> data =
        response?.data is String ? {} : response?.data ?? {};
    int statusCode = response?.statusCode ?? 500;
    String message = data['message'] ?? '';
    if (statusCode == 500) showMessage('Server or Database not running');
    if (message.isNotEmpty) {
      showMessage(message, duration: const Duration(seconds: 3));
    }
    if (statusCode == 401) {
      handleUnauthorized();
    }
    ResponseData responseData =
        ResponseData(data: data, statusCode: statusCode);
    return responseData;
  }

  Future<void> handleUnauthorized() async {
    return storage.delete(key: StorageConstants.accessToken).then((value) {
      router.go(Routes.login);
    });
  }
}
