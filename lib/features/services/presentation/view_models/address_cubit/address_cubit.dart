import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../../../data/models/location_model.dart';


part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  static LocationModel? _locationModel;
  static LocationModel? get getLocationModel {
    return _locationModel;
  }
  // get distance Time between to locations
  static int calculateDistanceTime(double distance){
    // 100 KM/h
    double speed = 100;
    int time ;
    if (distance > 0){
      time = distance ~/speed;
    }else{
      time = 0;
    }
    print(time);
    // time in minutes
    return time*60 ;
  }
// get distance between to locations
  double calculateDistance({lat1, lon1, lat2, lon2})
  {
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
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
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          currentLocation.latitude!, currentLocation.longitude!);

      String address =
          '${placeMarks[0].country}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].locality}';

      double distance = calculateDistance(
        lat1: currentLocation.latitude!,
        lon1: currentLocation.longitude!,
        lat2: currentLocation.latitude!,
        lon2: currentLocation.longitude!,
      );
      _locationModel = LocationModel(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
        address: address,
        distance: distance,
        time: calculateDistanceTime(distance)
      );
      emit(MyLocationSuccess());
    } catch (error) {
      emit(MyLocationFailure());
    }
  }

// triggered when user want to select his location manually
  Future<LocationModel?> selectMyLocation(LatLng latLng) async {
    // start using geocoding package
    List<Placemark> placeMarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    String address = '${placeMarks[0].country}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].locality}';
    // start using location package
    loc.Location location = loc.Location();
    final currentLocation = await location.getLocation();

    double distance = calculateDistance(
      lat1: currentLocation.latitude,
      lon1: currentLocation.longitude,
      lat2:   latLng.latitude,
      lon2: latLng.longitude
    );
    _locationModel = LocationModel(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      address: address,
       distance:  distance,
      time: calculateDistanceTime(distance)
    );
    emit(MyLocationSuccess());
    return _locationModel;
  }
}
