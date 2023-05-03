import 'package:bloc/bloc.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'car_centers_states.dart';

class CarCenterCubit extends Cubit<CarCentersStates> {
  CarCenterCubit() : super(InitialState());

  late List<CarCenterModel> carCenters;
  late List<String> carCentersDocs;

  Future<void> getCarCenters() async {
    emit(GetCarCentersLoading());
    await FirebaseFirestore.instance.collection('Centers').get().then((value) {
      carCenters = value.docs.map((e) => CarCenterModel.fromJson(e.data())).toList();
      carCentersDocs = value.docs.map((e) => e.id).toList();
      emit(GetCarCentersSuccess(carCenters,carCentersDocs));
    }).catchError((error) {
      print("error is doc ::::: ${error.toString()}");
      emit(GetCarCentersFailure(error.toString()));
    });
  }
  // Future<void> getCarCentersDocs() async {
  //   emit(GetCarCentersDocsLoading());
  //   await FirebaseFirestore.instance.collection('Centers').get().then((value) {
  //     carCentersDocs = value.docs.map((e) => e.id).toList();
  //     emit(GetCarCentersDocsSuccess(carCentersDocs));
  //     emit(GetCarCentersSuccess(carCenters,carCentersDocs));
  //   }).catchError((error) {
  //     print("error is doc ::::: ${error.toString()}");
  //     emit(GetCarCentersDocsFailure(error.toString()));
  //   });
  // }

}
