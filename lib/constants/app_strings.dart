// ignore_for_file: unused_field

import 'package:tn_edii/constants/backend_urls.dart';

abstract class AppStrings {
  /// App name
  static const String appName = "TN-EDII";

  /// Target API url
  static String targetUrl = BackEndUrls.serverUrl;

  /// Backend API url
  static String apiUrl = "${targetUrl}api/v1/";

  /// Backend storage url
  static String imgUrl = targetUrl;

  /// Playstore application url
  static String playstoreUrl = 'https://Playstore.com';
}
