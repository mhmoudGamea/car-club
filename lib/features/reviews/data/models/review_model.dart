
import '../../../profile/data/models/user_model.dart';

class ReviewModel {
  String reviewText;
  String? reviewImage;
  double reviewRate;
  int helpfulCount;
  String uId;
  String carCenterDoc;
  final String sentiment;
  UserModel user;

  ReviewModel(
      {required this.reviewText,
      required this.carCenterDoc,
      this.reviewImage,
      required this.uId,
        required this.user,
        required this.helpfulCount,
      required this.reviewRate,
      required this.sentiment});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(

        carCenterDoc: json['carCenterDoc'],
        user: UserModel.fromJson(json['user']),
        uId: json['uId'],
        helpfulCount: json['helpfulCount'],
        reviewImage: json['reviewImage'],
        reviewRate: json['reviewRate'],
        reviewText: json['reviewText'],
        sentiment: json['sentiment']);
  }

  Map<String, dynamic> toMap() {
    return {
      'reviewText': reviewText,
      'uId': uId,
      'carCenterDoc': carCenterDoc,
      'reviewRate': reviewRate,
      'reviewImage': reviewImage,
      'helpfulCount': helpfulCount,
      'user':user.toMap(),
      'sentiment': sentiment,
    };
  }
}
