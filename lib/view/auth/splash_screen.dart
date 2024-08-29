import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/repositories/auth_repository.dart';
import 'package:tn_edii/services/route/router.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/services/storage/storage_constants.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) => init());
    super.initState();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 1));
    String? user = await securedStorage.read(key: StorageConstants.user);
    String accessToken =
        await securedStorage.read(key: StorageConstants.accessToken) ?? '';
    isInitialized = true;
    if (user != null) {
      authProvider.user = User.fromJson(jsonDecode(user));
      authProvider.accessToken = accessToken;
      AuthRepository().navigateHome(context);
      return;
    }
    context.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Palette.primary,
        body: Center(
            child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: ThemeGuide.cardDecoration(),
                child: Image.asset(
                  LocalImages.logo,
                  height: context.widthHalf(),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
