import 'package:tn_edii/constants/assets/local_icons.dart';
import 'package:tn_edii/services/route/routes.dart';

class BottomBarData {
  List<BottomBarDatum> data = [
    BottomBarDatum(title: "HOME", image: LocalIcons.home, route: Routes.home),
    BottomBarDatum(
        title: "RESOURCES",
        image: LocalIcons.resources,
        route: Routes.resources),
    BottomBarDatum(
        title: "TRAINING", image: LocalIcons.training, route: Routes.resources),
    BottomBarDatum(
        title: "PROFILE", image: LocalIcons.profile, route: Routes.resources),
  ];
}

class BottomBarDatum {
  final String title, image, route;

  BottomBarDatum({required this.title, this.image = '', required this.route});
}
