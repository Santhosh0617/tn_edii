import 'package:flutter/material.dart';
import 'package:tn_edii/services/route/route_transition.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/view/auth/forgot_password_screen.dart';
import 'package:tn_edii/view/auth/login_screen.dart';
import 'package:tn_edii/view/auth/otp_screen.dart';
import 'package:tn_edii/view/auth/register_screen.dart';
import 'package:tn_edii/view/auth/splash_screen.dart';
import 'package:tn_edii/view/course_screen/screens/course_detail_screen.dart';
import 'package:tn_edii/view/home/screens/home_screen.dart';
import 'package:tn_edii/view/main_screen.dart';
import 'package:tn_edii/view/profile/screens/app_info.dart';
import 'package:tn_edii/view/profile/screens/edit_profile.dart';
import 'package:tn_edii/view/profile/screens/feedback.dart';
import 'package:tn_edii/view/profile/screens/privacy_policy.dart';
import 'package:tn_edii/view/profile/screens/profile_screen.dart';
import 'package:tn_edii/view/resources/screens/resource_detail_screen.dart';
import 'package:tn_edii/view/resources/screens/resources_screen.dart';
import 'package:tn_edii/view/training/view/training_screen.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
bool isInitialized = false;
bool isLoggedIn = false;

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: MainScreen(child: child));
      },
      routes: [
        customShellRoute(path: Routes.home, child: const HomeScreen()),
        customShellRoute(
            path: Routes.resources, child: const ResourcesScreen()),
        customShellRoute(path: Routes.training, child: const TrainingScreen()),
        customShellRoute(path: Routes.profile, child: const ProfileScreen()),
      ],
    ),

    ///Splash
    customRoute(path: Routes.splash, child: const SplashScreen()),

    ///Course Detail Screen
    customRoute(path: Routes.courseDetail, child: const CourseDetailScreen()),

    ///Authentication
    customRoute(path: Routes.login, child: const LoginScreen()),
    customRoute(path: Routes.register, child: const RegisterScreen()),
    customRoute(path: Routes.otp, child: const OTPScreen()),
    customRoute(
        path: Routes.forgotPassword, child: const ForgotPasswordScreen()),
    customRoute(path: Routes.editProfile, child: const EditProfileScreen()),
    customRoute(path: Routes.privacy, child: const PrivacyPolicyScreen()),
    customRoute(path: Routes.appInfo, child: const AppInfoScreen()),
    customRoute(path: Routes.feedback, child: const FeedBackScreen()),
    customRoute(
        path: Routes.resourcesDetail, child: const ResourceDetailScreen()),
  ],
  redirect: (context, state) {
    String path = state.uri.path;
    bool isAuth = path == Routes.register ||
        path == Routes.forgotPassword ||
        path == Routes.otp;
    if (!isInitialized) return Routes.splash;
    if (!isLoggedIn && !isAuth) return Routes.login;
    return null;
  },
);

GoRoute customShellRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state) => NoTransitionPage(child: child));
}

GoRoute customRoute({required String path, required Widget child}) {
  return GoRoute(
      path: path,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
          child: child,
          transitionsBuilder:
              RouteTransition(direction: TransitionDirection.left).slide));
}
