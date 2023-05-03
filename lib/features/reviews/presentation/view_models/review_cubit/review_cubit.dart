import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';
import '../../../data/repos/review_repo.dart';

class ReviewCubit extends Cubit<ReviewStates> {
  ReviewCubit({required this.reviewRepo}) : super(InitialReview());


  final ReviewRepo reviewRepo;
  late  String reviewText;
  late double rate = 0.0;
  late ReviewModel reviewModel;

  setReviewRate(double value) {
    rate = value;
    emit(ChangeRateValue());
  }
  double getReviewRate(){return rate;}

  final TextEditingController controller = TextEditingController();
  TextEditingController getReviewTextController(){return controller;}

  // pick reviewImage
  late File file;
  Future<void> pickReviewImage({required context}) async {

    var result = await reviewRepo.pickReviewImage(context: context);
    emit(LoadingPickReviewImage());
    result.fold((l) {
      emit(FailurePickReviewImage());
    }, (r) {
      Helper.showCustomToast(context: context, bgColor: Colors.greenAccent, icon: FontAwesomeIcons.check, msg: "1 image selected");
      emit(SuccessPickReviewImage());
      file = r;
    });
  }
  // upload reviewImage
  late String link;
  Future<void> uploadReviewImage({required File image}) async {
    var result = await reviewRepo.uploadReviewImage(image: image);
    emit(LoadingUploadReviewImage());
    result.fold((l) {

      emit(FailureUploadReviewImage());

      }, (r) {
      emit(SuccessUploadReviewImage());
      link = r;
    });

  }
  // add review
  Future<void> addReview(context,String centerDoc,CarCenterModel carCenterModel )async {
    emit(LoadingAddReview());
    reviewModel = ReviewModel(
        reviewText: getReviewTextController().text,
        reviewImage: link,
        carCenterDoc: centerDoc,
        uId: uId,
        helpfulCount: 0,
        reviewRate: getReviewRate()
    );
    CarCenterModel newCarCenter = CarCenterModel(
      isOpen: carCenterModel.isOpen,
      reviewCount: (carCenterModel.reviewCount)+1,
      credit: carCenterModel.credit,
      offers: carCenterModel.offers,
      delivery: carCenterModel.delivery,
      uId: carCenterModel.uId,
      latitude: carCenterModel.latitude,
      longitude: carCenterModel.longitude,
      date: carCenterModel.date,
      name:carCenterModel. name,
      description: carCenterModel.description,
      address:carCenterModel. address,
      phone: carCenterModel.phone,
      phone2: carCenterModel.phone2,
      openingTimes: carCenterModel.openingTimes,
      images: carCenterModel.images,
      distance: carCenterModel.distance,
      time: carCenterModel.time,
    );
    await reviewRepo.addReview(
      review: reviewModel.toMap(),
    ).then((value) {
      Helper.showCustomToast(context: context, bgColor: Colors.greenAccent, icon: FontAwesomeIcons.check, msg: "review added successfully");
      FirebaseFirestore.instance.collection("Centers").doc(centerDoc).update(newCarCenter.toMap());
      emit(SuccessAddReview());
    }).catchError((error){
      Helper.showCustomToast(context: context, bgColor: Colors.red, icon: FontAwesomeIcons.x, msg: "Review add failure");
      emit(FailureAddReview());
    });
  }

}
