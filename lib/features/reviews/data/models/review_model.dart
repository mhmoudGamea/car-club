class ReviewModel {
  String reviewText;
  String? reviewImage;
  double reviewRate;
  int helpfulCount;
  String uId;
  String carCenterDoc;
  bool like;
  final String sentiment;

  ReviewModel(
      {required this.reviewText,
      required this.carCenterDoc,
      this.reviewImage,
      required this.uId,
      required this.helpfulCount,
      required this.reviewRate,
      required this.like,
      required this.sentiment});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        carCenterDoc: json['carCenterDoc'],
        like: json['like'],
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
      'like': like,
      'uId': uId,
      'carCenterDoc': carCenterDoc,
      'reviewRate': reviewRate,
      'reviewImage': reviewImage,
      'helpfulCount': helpfulCount,
      'sentiment': sentiment,
    };
  }
}
