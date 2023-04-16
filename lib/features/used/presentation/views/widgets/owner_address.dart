import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    ),
                  ),
                ),
                const Center(
                    child: Icon(
                  Icons.location_on_rounded,
                  size: 25,
                )),
                Center(
                  child: CircleAvatar(
                    backgroundColor: blackColor.withOpacity(0.12),
                    radius: 45,
                  ),
                ),
                Positioned(
                  right: 13,
                  top: 13,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: whiteColor.withOpacity(0.4),
                      border: Border.all(width: 1, color: greyColor),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.alt_route_rounded),
                      onPressed: () {
                        _mapLauncher(state.locationModel);
                      },
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
