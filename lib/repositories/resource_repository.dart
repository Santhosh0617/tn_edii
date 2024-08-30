import 'package:flutter/material.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/articles_model.dart';
import 'package:tn_edii/models/resource_model.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class ResourceRepository {
  String prefix = 'users/userList/';
  APIService get _api => APIService(prefixUrl: prefix);
  String artclePrefix = 'resource/';
  APIService get api => APIService(prefixUrl: artclePrefix);

  Future<bool> getResources(BuildContext context, String type) async {
    resourceProvider.isLoading = true;
    ResponseData responseData =
        await _api.get(context, ':$type', params: {type: type});
    resourceProvider.isLoading = false;
    if (responseData.hasError) return false;
    logger.e(responseData.datas);
    return true;
  }

  Future<bool> getUsers(BuildContext context, String endPoint) async {
    resourceProvider.isLoading = true;
    ResponseData responseData = await _api.get(context, endPoint);
    resourceProvider.isLoading = false;
    if (responseData.hasError) return false;
    List data = responseData.data['data'] ?? {};
    List<Resourses> resourseData = Resourses().fromJsonList(data);
    resourceProvider.resourseData = resourseData;
    return true;
  }

  Future<bool> getArticles(BuildContext context, String endPoint) async {
    resourceProvider.isLoading = true;
    ResponseData responseData = await api.get(context, endPoint);
    resourceProvider.isLoading = false;
    if (responseData.hasError) return false;
    List data = responseData.data['data'] ?? {};
    List<ArticlesModel> articleData = ArticlesModel().fromJsonList(data);
    resourceProvider.articleData = articleData;
    return true;
  }

}
