import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/review_repo.dart';

class ReviewCubit extends Cubit<ReviewStates> {
  ReviewCubit({required this.reviewRepo}) : super(InitialReview());


  final ReviewRepo reviewRepo;
  late final String reviewText;
  late final double rate;
  late ReviewModel reviewModel;

  setReviewRate(double value) {
    rate = value;
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

  Future<void> addReview(context,String centerDoc)async {
    reviewModel = ReviewModel(
        reviewText: getReviewTextController().text,
        reviewImage: link,
        uId: uId,
        count: 0,
        helpfulCount: 0,
        reviewRate: getReviewRate()
    );
    reviewRepo.addReview(
      centerDoc: centerDoc,
      review: reviewModel.toMap(),
      uId: uId
    );
  }
}
