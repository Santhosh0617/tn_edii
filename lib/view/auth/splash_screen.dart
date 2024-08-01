import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/services/route/router.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';

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
    await Future.delayed(const Duration(milliseconds: 500));
    isInitialized = true;
    context.go(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Palette.primary,
        body: Center(
            child: FadeInUp(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   LocalIcons.appIcon,
              //   height: context.widthQuarter(),
              // ),
              // const HeightFull(),
              TextCustom('EDII TN',
                  fontWeight: FontWeight.w800,
                  size: 24,
                  color: Palette.pureWhite)
            ],
          ),
        )),
      ),
    );
  }
}
