import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationApi {
  final LocationSettings _locationSettings =
      const LocationSettings(distanceFilter: 10);

  Future<LatLng?> getCurrentPosition() async {
    bool hasPermission = await _handleLocationPermission();
    if (!hasPermission) null;
    try {
      return await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) =>
              LatLng(position.latitude, position.longitude));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always ||
        permission != LocationPermission.whileInUse) {
      // PermissionStatus permissionStatus = await Permissionz.re///quest();
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        return false;
      }
    }

    return true;
  }

  double distance(LatLng driverPosition, LatLng userPosition) {
    return Geolocator.distanceBetween(
        driverPosition.latitude,
        driverPosition.longitude,
        userPosition.latitude,
        userPosition.longitude);
  }

  Stream<Position> locationStream() {
    return Geolocator.getPositionStream(locationSettings: _locationSettings);
  }
}
