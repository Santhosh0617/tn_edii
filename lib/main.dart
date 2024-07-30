import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tn_edii/constants/app_strings.dart';
import 'package:tn_edii/providers/info_provider.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/view/no_internet.dart';
import 'constants/keys.dart';
import 'services/route/router.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(MultiProvider(providers: providers, child: const MyApp())));
  CustomDateTime().getOffSet();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeManager, InfoProvider>(
      builder: (context, themeManager, info, child) {
        return MaterialApp.router(
          key: mainKey,
          builder: (BuildContext context, Widget? child) => Stack(children: [
            if (child != null) child,
            if (!info.isHadInternet) const NoInternetScreen(),
          ]),
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: lightTheme,
          // darkTheme: darkTheme,
          themeMode: themeManager.themeMode,
          routerConfig: router,
          scaffoldMessengerKey: snackbarKey,
        );
      },
    );
  }
}
