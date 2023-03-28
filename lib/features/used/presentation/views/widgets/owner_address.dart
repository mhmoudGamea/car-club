import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/widgets/shimmer_indecator.dart';
import '../../model_views/map_cubit/map_cubit.dart';

class OwnerAddress extends StatelessWidget {
  const OwnerAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is CarOwnerAddressSuccess) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  zoom: 9.4746,
                  target: LatLng(
                    state.locationModel.latitude,
                    state.locationModel.longitude,
                  ),
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('m1'),
                    position: LatLng(
                      state.locationModel.latitude,
                      state.locationModel.longitude,
                    ),
                  ),
                },
              ),
            );
          } else {
            return const ShimmerIndicator(width: double.infinity, height: 200);
          }
        },
      ),
    );
  }
}
