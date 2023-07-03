import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/helper.dart';
import '../../../data/repos/review_repo.dart';

class ReviewCubit extends Cubit<ReviewStates> {
  ReviewCubit({required this.reviewRepo}) : super(InitialReview());
  // ADD button
  bool press = false;
  final ReviewRepo reviewRepo;
  late String reviewText;
  late double rate = 0.0;
  late ReviewModel reviewModel;

  setReviewRate(double value) {
    rate = value;
    emit(ChangeRateValue());
  }

  double getReviewRate() {
    return rate;
  }

  final TextEditingController controller = TextEditingController();
  TextEditingController getReviewTextController() {
    return controller;
  }

  // pick reviewImage
  File? file;

  File? get getPickedImage {
    return file;
  }

  Future<void> pickReviewImage({required context}) async {
    var result = await reviewRepo.pickReviewImage(context: context);
    emit(LoadingPickReviewImage());
    result.fold((l) {
      // file = null;
      emit(FailurePickReviewImage());
    }, (r) {
      file = r;
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.greenAccent,
          icon: FontAwesomeIcons.check,
          msg: "1 image selected");
      emit(SuccessPickReviewImage());
    });
  }

  // upload reviewImage
  String? link;
  Future<void> uploadReviewImage({File? image}) async {
    var result = await reviewRepo.uploadReviewImage(image: image!);
    emit(LoadingUploadReviewImage());
    result.fold((l) {
      link = "";
      emit(FailureUploadReviewImage());
    }, (r) {
      link = r;
      emit(SuccessUploadReviewImage());
    });
  }

  // this function 'll perform sentiment analysis on user review and return [positive, negative, natural]
  // then if it return positive so it's helpful review, negative so it's nothelpful, or natural which can
  // be concedered a nothelpful bec it's score is 0

  Future<String> sentimentAnalysis() async {
    final sentiment = Sentiment();
    Map<String, dynamic> analysis =
        sentiment.analysis(getReviewTextController().text);
    if (analysis['score'] >= -5 && analysis['score'] < 0) {
      return 'Not Helpful';
    } else if (analysis['score'] <= 5 && analysis['score'] > 0) {
      return 'Helpful';
    } else {
      return 'Natural';
    }
  }

  // add review
  Future<void> addReview(
      context, String centerDoc, CarCenterModel carCenterModel) async {
    emit(LoadingAddReview());
    final sentiment = await sentimentAnalysis();
    reviewModel = ReviewModel(
      like: false,
      reviewText: getReviewTextController().text,
      reviewImage: link ?? "",
      carCenterDoc: centerDoc,
      uId: uId,
      helpfulCount: 0,
      reviewRate: getReviewRate(),
      sentiment: sentiment,
    );

    await reviewRepo
        .addReview(
      review: reviewModel.toMap(),
    )
        .then((value) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.greenAccent,
          icon: FontAwesomeIcons.check,
          msg: "review added successfully");
      FirebaseFirestore.instance
          .collection("Centers")
          .doc(centerDoc)
          .update({'reviewCount': (carCenterModel.reviewCount) + 1});
      emit(SuccessAddReview());
    }).catchError((error) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.red,
          icon: FontAwesomeIcons.x,
          msg: "Review add failure");
      emit(FailureAddReview());
    });
  }

  late List<ReviewModel> reviews;
  late List<String> reviewsDocs;
  late List<String> carCenterReviewsDocs;
  Future<void> getReviews({required String carCenterDoc}) async {
    emit(LoadingGetReviews());
    reviews = [];
    reviewsDocs = [];
    carCenterReviewsDocs = [];
    FirebaseFirestore.instance
        .collection("Reviews")
        .snapshots()
        .listen((event) async {
      reviews = event.docs.map((e) => ReviewModel.fromJson(e.data())).toList();
      reviewsDocs = event.docs.map((e) {
        if (e.data()['carCenterDoc'] == carCenterDoc) {
          carCenterReviewsDocs.add(e.id);
        }
        return e.id;
      }).toList();
      emit(SuccessGetReviews());
    }).onError((error) async {
      print(error.toString());
      emit(FailureGetReviews());
    });
  }

  late List<ReviewModel> carCenterReviews;
  Future<void> getCarCenterReviews({required String carCenterDoc}) async {
    carCenterReviews = [];
    emit(LoadingGetCarCenterReviews());
    for (int i = 0; i < reviews.length; i++) {
      if (reviews[i].carCenterDoc == carCenterDoc) {
        carCenterReviews.add(reviews[i]);
      }
    }
    emit(SuccessGetCarCenterReviews());
  }



  List<ReviewModel> likedReviews = [];
  List<String> likedReviewsId = [];
  Future<void> getLikedReviews() async {
    likedReviews = [];
    likedReviewsId = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('likedReviews')
        .get()
        .then((value) {
      likedReviewsId = value.docs.map((e) => e.id).toList();
      likedReviews = value.docs.map((e) => ReviewModel.fromJson(e.data())).toList();
      // emit(SuccessGetLikedReviews());
    }).catchError((error) {
      debugPrint(error.toString());
      // emit(FailureAddLikedReview());
    });
  }
  bool isLikedBefore(String reviewId) {
    return likedReviewsId.contains(reviewId);
  }
  Future<void> addLikedReview({required ReviewModel model, required String doc}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection('likedReviews')
        .doc(doc)
        .set(model.toMap())
        .then((value) {
      // emit(SuccessAddLikedReview());
    }).catchError((error) {
      debugPrint(error.toString());
      // emit(FailureAddLikedReview());
    });
  }
  Future<void> clickHelpful({required ReviewModel model, required String doc}) async {
    // emit(LoadingLike());
    getLikedReviews().then((value) async {
      bool liked = isLikedBefore(doc);
      if (liked == false) {
        // if(count==0){
        // liked = !liked;
        await FirebaseFirestore.instance.collection("Reviews").doc(doc).update({
          'helpfulCount': model.helpfulCount + 1,
          'like': liked
        }).then((value) {
          // count++;
          addLikedReview(doc: doc, model: model);
          // emit(SuccessLikeIncrease());
        }).catchError((error) {
          // emit(FailureLike());
        });
      } else {
        // liked = !liked;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(uId)
            .collection("likedReviews")
            .doc(doc)
            .delete()
            .then((value) async {
          await FirebaseFirestore.instance
              .collection("Reviews")
              .doc(doc)
              .update({
            'helpfulCount': model.helpfulCount - 1,
            'like': liked
          }).then((value) {
            // count--;
            getLikedReviews();
            // emit(SuccessLikeDecrease());
          }).catchError((error) {
            // emit(FailureLike());
          });
        }).catchError((error) {});
      }
    });
  }

}
