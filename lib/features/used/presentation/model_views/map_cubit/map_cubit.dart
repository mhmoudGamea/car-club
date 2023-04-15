import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../post/data/models/location_model.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  LocationModel? _locationModel;

  LocationModel? get getLocationModel {
    return _locationModel;
  }

// triggered when user want to select his location automatically
  Future<void> getOwnerLocation(String ownerAddress) async {
    // then pass lat, long to geocoder package to get address
    // then save lat, long, address in LocationModel

    emit(CarOwnerAddressLoading());

    try {
      List<Location> locations = await locationFromAddress(ownerAddress);

      _locationModel = LocationModel(
          latitude: locations[0].latitude,
          longitude: locations[0].longitude,
          address: ownerAddress);
      emit(CarOwnerAddressSuccess(locationModel: _locationModel!));
    } catch (error) {
      //TODO: handle if user try to open details in used view and he is not connected to internet
      //PlatformException(IO_ERROR, A network error occurred trying to lookup the address ''., null, null)
      emit(CarOwnerAddressFailure());
    }
  }
}
