import '../../../data/models/car_center_model.dart';

abstract class CarCentersStates{}

class InitialState extends CarCentersStates{}

class GetCarCentersLoading extends CarCentersStates{}
class GetCarCentersSuccess extends CarCentersStates{
  final List<CarCenterModel> carCenters;
  final List<String> carCenterDoc;

  GetCarCentersSuccess(this.carCenters, this.carCenterDoc);
}
class GetCarCentersFailure extends CarCentersStates{
  final String error;

  GetCarCentersFailure(this.error);
}

// class GetCarCentersDocsLoading extends CarCentersStates{}
// class GetCarCentersDocsSuccess extends CarCentersStates{
//   final List<String> carCentersDocs;
//
//   GetCarCentersDocsSuccess(this.carCentersDocs);
// }
// class GetCarCentersDocsFailure extends CarCentersStates{
//   final String error;
//
//   GetCarCentersDocsFailure(this.error);
// }
