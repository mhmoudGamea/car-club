import 'package:bloc/bloc.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../reviews/data/models/review_model.dart';
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

  late double rate  = 0;
  Future<void> getRate(String carCenterDoc)   async {
    double sumRate = 0.0;
    List<ReviewModel?>? carCenterReviews = [];
    List<ReviewModel?>? reviews = [];
    await FirebaseFirestore.instance
      .collection("Reviews")
      .get().then((value) {
        reviews = value.docs.map((e) =>ReviewModel.fromJson(e.data())).toList();
    }).catchError((error){
      print("Error 1: ${error.toString()}");
    }).then((value) {
// print(reviews!.length);
      for (var element in reviews!) {
        if(element?.carCenterDoc == carCenterDoc){
          // print("reviews!.length");
          carCenterReviews.add(element);
        }
      }

        print(carCenterReviews.length);

        for (var element in carCenterReviews) {
          sumRate = sumRate + element!.reviewRate;

        }
        rate = sumRate / carCenterReviews.length;


    });


    // return rate;
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
