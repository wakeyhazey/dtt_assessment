import 'package:map_launcher/map_launcher.dart';

class LaunchLocalMap {
  LaunchLocalMap._();

  static Future<void> launchMaps(double latitude, double longitude,
      AvailableMap chosenMap, String title) async {
    await chosenMap.showMarker(
      coords: Coords(latitude, longitude),
      title: title,
    );
  }
}
