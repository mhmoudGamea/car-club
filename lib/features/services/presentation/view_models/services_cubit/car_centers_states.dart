import '../../../data/models/car_center_model.dart';

abstract class CarCentersStates{}

class InitialState extends CarCentersStates{}

class GetCarCentersLoading extends CarCentersStates{}
class GetCarCentersSuccess extends CarCentersStates{
  final List<CarCenterModel> carCenters;

  GetCarCentersSuccess(this.carCenters);
}
class GetCarCentersFailure extends CarCentersStates{
  final String error;

  GetCarCentersFailure(this.error);
}
