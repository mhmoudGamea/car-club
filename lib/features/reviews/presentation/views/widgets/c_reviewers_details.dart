import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class CReviewersDetails extends StatelessWidget {
  const CReviewersDetails({Key? key, required this.model}) : super(key: key);
  final ReviewModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // image section
      leading: const CircleAvatar(
        radius: 26,
        backgroundImage: NetworkImage(
            'https://img.freepik.com/free-photo/arrangement-delicious-taco-bread-ingredients_23-2148329051.jpg?w=1060&t=st=1682412421~exp=1682413021~hmac=88e38513ec31607f0715730044891dcc79f454922d7de465d15d669698a001e2'),
      ),
      // name section
      title: Text(
        'Tako Holiday',
        style: Styles.title15.copyWith(color: blackColor),
      ),
      // rating section and date
      subtitle: Row(
        children: [
          Row(
            children: List.generate(
              model.reviewRate.toInt() ,
              (index) => const Icon(
                Icons.star_rounded,
                size: 15,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '1 minute ago',
            style: Styles.title13.copyWith(color: greyColo3),
          ),
        ],
      ),
    );
  }
}
