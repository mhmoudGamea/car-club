class ReviewModel {
  String reviewText;
  String reviewImage;
  double reviewRate;
  int count;
  int helpfulCount;
  String uId;

  ReviewModel(
      {required this.reviewText,
      required this.reviewImage,
        required this.uId,
        required this.count,
        required this.helpfulCount,
      required this.reviewRate});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        count: json['count'],
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
      'reviewRate': reviewRate,
      'reviewImage': reviewImage,
      'count':count,
      'helpfulCount':helpfulCount
    };
  }

}
