import 'package:flutter/material.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class ResourceRepository {
  String prefix = 'resource';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> getResources(BuildContext context, String type) async {
    resourceProvider.isLoading = true;
    ResponseData responseData =
        await _api.get(context, ':$type', params: {type: type});
    resourceProvider.isLoading = false;
    if (responseData.hasError) return false;
    logger.e(responseData.datas);
    return true;
  }
}
