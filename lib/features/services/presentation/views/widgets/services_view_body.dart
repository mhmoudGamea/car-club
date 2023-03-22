import 'dart:collection';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/services/presentation/views/add_car_center_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ServicesViewBody extends StatefulWidget {
  const ServicesViewBody({Key? key}) : super(key: key);

  @override
  State<ServicesViewBody> createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
  var markers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(target: LatLng(30.0444, 31.2357), zoom: 10),
            markers: markers,
            onMapCreated: (controller) {
              setState(() {
                markers.add(Marker(
                    markerId: const MarkerId("1"),
                    position: const LatLng(30.0444, 31.2357),
                    infoWindow: InfoWindow(
                      title: "Car Center Name",
                      snippet: "description of the car center name",
                      onTap: () {
                      },
                    )
                ));
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: babyBlue
              ),
              child: MaterialButton(
                child: const Text("Show Car Centers"),
                onPressed: (){
                  GoRouter.of(context).push(AddCarCenter.rn);
                },
              ),
            ),
          )
        ],

      ),
    );
  }
}
