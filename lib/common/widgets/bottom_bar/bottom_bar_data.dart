import 'package:tn_edii/services/route/routes.dart';

class BottomBarData {
  List<BottomBarDatum> data = [
    BottomBarDatum(
        filledImage: 'LocalIcons.home',
        outlinedImage: "LocalIcons.homeOutlined",
        route: Routes.home),
    BottomBarDatum(
        filledImage: "LocalIcons.location",
        outlinedImage: "LocalIcons.locationOutlined",
        route: Routes.home),
    BottomBarDatum(
        filledImage: "LocalIcons.reels",
        outlinedImage: "LocalIcons.reelsOutlined",
        route: Routes.home),
  ];
}

class BottomBarDatum {
  final String outlinedImage, filledImage, route;

  BottomBarDatum(
      {this.outlinedImage = '', this.filledImage = '', required this.route});
}
