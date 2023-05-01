import 'dart:io';

import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'car_center_map.dart';
class CarCenterAddress extends StatelessWidget {
  const CarCenterAddress({
    super.key, required this.carCenterModel,
  });
  final CarCenterModel carCenterModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Address",
                style: Styles.title16,
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.locationArrow,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text('${carCenterModel.distance.toInt()} Km Away'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: (MediaQuery.of(context).size.width / 3) * 2.6,
            child: Text(
              'place : ${carCenterModel.address}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.title13
                  .copyWith(fontWeight: FontWeight.w500),
              softWrap: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                height: 200,
                width: (MediaQuery.of(context).size.width/4)*3.5,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(

                    onTap: (argument) {
                      GoRouter.of(context).push(CarCenterMap.rn,extra: carCenterModel);
                    },
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    rotateGesturesEnabled: false,

                    padding: const EdgeInsets.all(10),
                    mapType: MapType.normal,
                    initialCameraPosition:  CameraPosition(
                      zoom: 9.4746,
                      target: LatLng(carCenterModel.latitude, carCenterModel.longitude),
                    ),
                    markers: {
                      Marker(
                          markerId:  const MarkerId('1'),
                          position: LatLng(carCenterModel.latitude, carCenterModel.longitude),
                          infoWindow: InfoWindow(title: carCenterModel.name)
                      ),
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
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
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: mintGreen,
                    child: Icon(FontAwesomeIcons.locationArrow,size: 20,color: whiteColor,),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


