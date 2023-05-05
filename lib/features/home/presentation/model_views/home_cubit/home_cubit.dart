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
      (books) => emit(HomeSuccess(books)),
    );
  }

  CollectionReference carsCollectionRF =
      FirebaseFirestore.instance.collection('cars');

  // this func executed to make favourites field in firestore by add or remove user uid

  void updateFavourites(
      CarModel car, bool isLiked, BuildContext context) async {
    // print(isLiked);
    await carsCollectionRF.where('model', isEqualTo: car.model).get().then(
      (value) async {
        // here i got only one document if there is no 2 posts added at the same second
        // for (var doc in value.docs) {
        //   if (isLiked) {
        //     await carsCollectionRF.doc(doc.id).update({
        //       'favourites': FieldValue.arrayUnion([uId])
        //     }).then((value) async {
        //       Helper.showCustomToast(
        //           context: context,
        //           bgColor: babyBlue,
        //           icon: FontAwesomeIcons.circleCheck,
        //           msg: 'Added to your favourites');
        //       //await addToFavourites(model);
        //     });
        //   } else {
        //     await carsCollectionRF.doc(doc.id).update({
        //       'favourites': FieldValue.arrayRemove([uId])
        //     }).then((value) async {
        //       Helper.showCustomToast(
        //           context: context,
        //           bgColor: babyBlue,
        //           icon: FontAwesomeIcons.circleCheck,
        //           msg: 'Removed from your favourites');
        //       //await removeFromFavourites(model);
        //     });
        //   }
        // }
      },
      onError: (error) {
        emit(IsFavouriteFailure());
      },
    );
  }
}
