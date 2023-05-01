import 'dart:io';

import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CarCenterMap extends StatelessWidget {
  const CarCenterMap({Key? key, required this.carCenterModel}) : super(key: key);
  final CarCenterModel carCenterModel;
  static const rn = '/CarCenterMap';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map",
          style: Styles.title16.copyWith(fontSize: 20),
        ),
        actions: [
          PopupMenuButton(

              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Directions                "),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 0) {
                  late final String url;
                  if (Platform.isAndroid) {
                    url = 'google.navigation:q=${carCenterModel.latitude},${carCenterModel.longitude}';
                    // url = 'https://www.google.com/maps/dir/?api=1&destination=30.55032685986512,31.010894961655136&travelmode=driving&dir_action=navigate';
                    // url = 'geo:30.55032685986512,31.010894961655136';
                    // url = 'https://www.google.com/maps/search/?api=1&query=30.55032685986512,31.010894961655136';
                    // url = 'comgooglemaps://?daddr=30.55032685986512,31.010894961655136';
                    // url = 'comgooglemaps://?q=30.55032685986512,31.010894961655136';
                    // url = 'https://www.google.com/maps?daddr=30.55032685986512,31.010894961655136&dir_action=navigate';
                  } else {
                    url = 'comgooglemaps://?daddr=${carCenterModel.latitude},${carCenterModel.longitude}';
                  }
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    print('cannot launch url');
                  }


                  // String googleUrl = 'https://www.google.com/maps/search/?api=1&query=30.55032685986512,31.010894961655136';
                  // if (await canLaunch(googleUrl)) {
                  //   await launch(googleUrl);
                  // }

                  // var uri = Uri.parse("google.navigation:q=30.55032685986512,31.010894961655136&mode=d");
                  //     if (await canLaunchUrl(uri)) {
                  //     await launchUrl(uri);
                  //     }
                }
              })
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        padding: const EdgeInsets.all(10),
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 9.4746,
          target: LatLng(30.5476041, 31.0084369),
        ),
        markers: {
          Marker(
              markerId: const MarkerId('1'),
              position: LatLng(carCenterModel.latitude, carCenterModel.longitude),
              infoWindow: InfoWindow(title: carCenterModel.name)),
        },
      ),
    );
  }
}
