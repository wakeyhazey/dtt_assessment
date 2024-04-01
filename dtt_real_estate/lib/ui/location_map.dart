import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:real_estate_dtt/utils/map_utils.dart';

class LocationMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String title;

  LocationMap(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.title});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 14.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: const MarkerId('id'),
              position: LatLng(latitude, longitude),
            )
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
                onPressed: () async {
                  await MapLauncher.installedMaps.then(
                    (availableMaps) async => showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Open with',
                                      style: CustomTextStyle.title03),
                                  ...availableMaps
                                      .map((map) => Card(
                                            child: ListTile(
                                              onTap: () {
                                                LaunchLocalMap.launchMaps(
                                                    latitude,
                                                    longitude,
                                                    map,
                                                    title);
                                              },
                                              title: Text(
                                                map.mapName,
                                                style: CustomTextStyle.title02,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ]),
                          ),
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.directions,
                  size: 35,
                )),
          ),
        )
      ],
    );
  }
}
