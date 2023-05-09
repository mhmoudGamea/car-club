import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../data/models/car_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewCars() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchNewCars();
    result.fold(
      (failure) => emit(HomeFailure(failure.errMsg)),
      (cars) => emit(HomeSuccess(cars)),
    );
  }

  Future<void> updateFavourites(
      CarModel car, bool isLiked, BuildContext context) async {
    var result = await homeRepo.updateFavourites(car, isLiked, context);
    result.fold(
      (failure) => emit(IsFavouriteFailure(failure.errMsg)),
      (_) {},
    );
  }

  // void updateFavourites(
  //     CarModel car, bool isLiked, BuildContext context) async {
  //   CollectionReference carsCollectionRF = FirebaseFirestore.instance
  //       .collection('cars')
  //       .doc('brands')
  //       .collection(car.brand.toLowerCase());
  //   var data1 = await carsCollectionRF.get();
  //   for (var element in data1.docs) {
  //     if (element.id == car.model) {
  //       if (isLiked) {
  //         await carsCollectionRF.doc(element.id).update({
  //           'favorites': FieldValue.arrayUnion([uId])
  //         }).then((value) async {
  //           Helper.showCustomToast(
  //               context: context,
  //               bgColor: babyBlue,
  //               icon: FontAwesomeIcons.circleCheck,
  //               msg: 'Added to your favourites');
  //         });
  //       } else {
  //         await carsCollectionRF.doc(element.id).update({
  //           'favorites': FieldValue.arrayRemove([uId])
  //         }).then((value) async {
  //           Helper.showCustomToast(
  //               context: context,
  //               bgColor: babyBlue,
  //               icon: FontAwesomeIcons.circleCheck,
  //               msg: 'Removed from your favourites');
  //         });
  //       }
  //     }
  //   }
  // }
}
