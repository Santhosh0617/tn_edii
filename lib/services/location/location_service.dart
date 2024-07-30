// ignore_for_file: depend_on_referenced_packages

import 'package:location/location.dart';
import 'package:tn_edii/utilities/message.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class LocationService {
  static bool serviceEnabled = false;

  static Future<LocationData?> getLocation() async {
    LocationData? locationData;
    Location location = Location();
    locationData = await location.getLocation();
    return locationData;
  }

  static Future<LocationData?> initLocation() async {
    Location location = Location();
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      showMessage('Kindly turn on the location');
      return null;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        permission.openAppSettings();
        return null;
      }
    }
    return await getLocation();
  }
}
