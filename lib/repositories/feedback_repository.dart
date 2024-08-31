import 'package:flutter/material.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';
import 'package:tn_edii/utilities/message.dart';

class FeedbackRepository {
  String prefix = 'feedback/';
  APIService get api => APIService(prefixUrl: prefix);

  Future<bool> addFeedback(
      BuildContext context, Map<String, dynamic> params) async {
    feedbackProvider.isLoading = true;
    ResponseData responseBody =
        await api.post(context, "addfeedback", body: params);
    feedbackProvider.isLoading = false;
    if (responseBody.hasError) return false;
    showMessage(responseBody.data['message'] ?? '');
    return true;
  }
}
