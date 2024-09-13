import 'package:flutter/material.dart';
import 'package:tn_edii/models/curriculum.dart';
import 'package:tn_edii/models/my_course.dart';
import 'package:tn_edii/models/response.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/services/api/api_services.dart';
import 'package:tn_edii/utilities/extensions/response_extension.dart';

class CourseRepository {
  String prefix = 'usercourse';
  APIService get _api => APIService(prefixUrl: prefix);

  Future<bool> getRegisteresCourses(BuildContext context) async {
    courseProvider.isLoading = true;
    ResponseData responseData =
        await _api.get(context, 'user/${authProvider.user?.id}');
    courseProvider.isLoading = false;
    courseProvider.myCourses =
        MyCourse().fromJsonList(responseData.data['data'] ?? []);
    if (responseData.hasError) return false;
    return true;
  }

  Future<bool> getCourseCurriculum(BuildContext context, int id) async {
    courseProvider.isLoading = true;
    ResponseData responseData =
        await APIService().get(context, '/courseVideo/$id');
    courseProvider.isLoading = false;
    courseProvider.curriculums =
        Curriculum().fromJsonList(responseData.data['data'] ?? []);
    if (responseData.hasError) return false;
    return true;
  }
}
