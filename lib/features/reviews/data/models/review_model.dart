class ReviewModel {
  String reviewText;
  String reviewImage;
  double reviewRate;
  int helpfulCount;
  String uId;
  String carCenterDoc;

  ReviewModel(
      {required this.reviewText,
        required this.carCenterDoc,
      required this.reviewImage,
        required this.uId,
        required this.helpfulCount,
      required this.reviewRate});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        carCenterDoc:json['carCenterDoc'],
        uId: json['uId'],
        helpfulCount: json['helpfulCount'],
      reviewImage: json['reviewImage'],
      reviewRate: json['reviewRate'],
      reviewText: json['reviewText']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reviewText': reviewText,
      'uId': uId,
      'carCenterDoc':carCenterDoc,
      'reviewRate': reviewRate,
      'reviewImage': reviewImage,
      'helpfulCount':helpfulCount
    };
  }

}
