import 'package:car_club/features/post/data/models/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  // String? _previewAddress;

  // String? get getPreviewAddress {
  //   return _previewAddress;
  // }

  LocationModel? _locationModel;

  LocationModel? get getLocationModel {
    return _locationModel;
  }

// triggered when user want to select his location automatically
  Future<void> getMyLocation() async {
    // this function use location package to get lat, long
    // then pass lat, long to geocoder package to get address
    // then save lat, long, address in LocationModel

    emit(MyLocationLoading());
    // start using location package
    loc.Location location = loc.Location();

    try {
      final currentLocation = await location.getLocation();

      // start using geocoding package
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLocation.latitude!, currentLocation.longitude!);

      String address =
          '${placemarks[0].country}, ${placemarks[0].administrativeArea}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}';

      _locationModel = LocationModel(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
        address: address,
      );
      emit(MyLocationSuccess());
    } catch (error) {
      emit(MyLocationFailure());
    }
  }

// triggered when user want to select his location manually
  Future<LocationModel?> selectMyLocation(LatLng latLng) async {
    // start using geocoding package
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    String address =
        '${placemarks[0].country}, ${placemarks[0].administrativeArea}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].locality}';

    _locationModel = LocationModel(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      address: address,
    );
    emit(MyLocationSuccess());
    return _locationModel;
  }
}
