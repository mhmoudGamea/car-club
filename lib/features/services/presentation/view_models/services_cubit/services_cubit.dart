import 'package:bloc/bloc.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../reviews/data/models/review_model.dart';
import 'car_centers_states.dart';

class CarCenterCubit extends Cubit<CarCentersStates> {
  CarCenterCubit() : super(InitialState());

  late List<CarCenterModel> carCenters;
  late List<String> carCentersDocs;
  late List<double> rates;

  Future<void> getCarCenters() async {
    emit(GetCarCentersLoading());
    FirebaseFirestore.instance.collection('Centers').snapshots().listen((value) async {
      carCenters = value.docs.map((e) => CarCenterModel.fromJson(e.data())).toList();
      carCentersDocs = value.docs.map((e) => e.id).toList();
      await getRates(carCentersDocs).then((value) {
        emit(GetCarCentersSuccess(carCenters,carCentersDocs,rates));
      });

    }).onError((error) {
      print("error is doc ::::: ${error.toString()}");
      emit(GetCarCentersFailure(error.toString()));
    });
  }

  // Future<void> getCarCenters() async {
  //   emit(GetCarCentersLoading());
  //   await FirebaseFirestore.instance.collection('Centers').get().then((value) async {
  //     carCenters = value.docs.map((e) => CarCenterModel.fromJson(e.data())).toList();
  //     carCentersDocs = value.docs.map((e) => e.id).toList();
  //     print("carCentersDocs is done ...");
  //
  //   }).then((value) async {
  //     print("GetRated is loading ...");
  //     print("carCentersDocs = ${carCentersDocs.length}");
  //
  //     await getRates(carCentersDocs).then((value) {
  //       print("GetRated is done ...");
  //       emit(GetCarCentersSuccess(carCenters,carCentersDocs,rates));
  //     });
  //   }).catchError((error) {
  //     print("error is doc ::::: ${error.toString()}");
  //     emit(GetCarCentersFailure(error.toString()));
  //   });
  // }

  Future<double> getRate(String carCenterDoc)   async {
    double rate = 0.0;
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
      if(carCenterReviews.isNotEmpty){
        for (var element in carCenterReviews) {
          sumRate = sumRate + element!.reviewRate;
        }
        rate = sumRate / carCenterReviews.length;
      }else{
        rate = 0;
      }
    });
    return rate;
  }

  Future<void> getRates(List<String> carCenterDocs)async {
    rates = [];
    for (var element in carCenterDocs) {
      await getRate(element).then((value) {
        rates.add(value);
      });
    }
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
