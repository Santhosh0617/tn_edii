import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/providers/auth_provider.dart';
import 'package:tn_edii/providers/course_provider.dart';
import 'package:tn_edii/providers/feedback_provider.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/providers/info_provider.dart';
import 'package:tn_edii/providers/resource_provider.dart';
import 'package:tn_edii/theme/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Declaration for all providers
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeManager>(create: (context) => ThemeManager()),
  ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
  ChangeNotifierProvider<InfoProvider>(create: (context) => InfoProvider()),
  ChangeNotifierProvider<TrainingProvider>(
      create: (context) => TrainingProvider()),
  ChangeNotifierProvider<ResourceProvider>(
      create: (context) => ResourceProvider()),
  ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
  ChangeNotifierProvider<FeedbackProvider>(
      create: (context) => FeedbackProvider()),
  ChangeNotifierProvider<CourseProvider>(create: (context) => CourseProvider()),
];

var themeManager =
    Provider.of<ThemeManager>(mainKey.currentContext!, listen: false);
var authProvider =
    Provider.of<AuthProvider>(mainKey.currentContext!, listen: false);
var infoProvider =
    Provider.of<InfoProvider>(mainKey.currentContext!, listen: false);
var trainingsProvider =
    Provider.of<TrainingProvider>(mainKey.currentContext!, listen: false);
var resourceProvider =
    Provider.of<ResourceProvider>(mainKey.currentContext!, listen: false);
var userProvider =
    Provider.of<UserProvider>(mainKey.currentContext!, listen: false);
var feedbackProvider =
    Provider.of<FeedbackProvider>(mainKey.currentContext!, listen: false);
var courseProvider =
    Provider.of<CourseProvider>(mainKey.currentContext!, listen: false);
