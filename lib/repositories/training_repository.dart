import 'package:flutter/material.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class TrainingRepository {
  String prefix = 'training';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> getTrainings(BuildContext context) async {
    trainingsProvider.isLoading = true;
    ResponseData responseData =
        await _api.get(context, '', params: {'istrainingall': true});
    trainingsProvider.isLoading = false;
    if (responseData.hasError) return false;
    trainingsProvider.trainings = Training().fromJsonList(responseData.datas);
    return true;
  }
}
