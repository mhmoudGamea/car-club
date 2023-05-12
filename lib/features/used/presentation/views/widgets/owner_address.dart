import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;

import '../../../../../core/widgets/shimmer_indecator.dart';
import '../../../../post/data/models/location_model.dart';
import '../../model_views/map_cubit/map_cubit.dart';

class OwnerAddress extends StatelessWidget {
  const OwnerAddress({Key? key}) : super(key: key);

  void _mapLauncher(LocationModel locationModel) async {
    final availableMaps = await launcher.MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: launcher.Coords(locationModel.latitude, locationModel.longitude),
      title: "Ocean Beach",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is CarOwnerAddressSuccess) {
            return Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        zoom: 9.4746,
                        target: LatLng(
                          state.locationModel.latitude,
                          state.locationModel.longitude,
                        ),
                      ),
                      zoomControlsEnabled: false,
                      markers: {
                        Marker(
                          markerId: const MarkerId('1'),
                          position: LatLng(state.locationModel.latitude,
                              state.locationModel.longitude),
                        ),
                      },
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      _mapLauncher(state.locationModel);
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: mintGreen,
                      child: Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 19,
                        color: whiteColor,
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const ShimmerIndicator(width: double.infinity, height: 200);
          }
        },
      ),
    );
  }
}
