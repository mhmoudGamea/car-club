import 'package:car_club/features/reviews/presentation/views/widgets/c_reviewers_details.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'c_helpful_widget.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: greyColor.withOpacity(0.7),
            spreadRadius: 1,
            offset: const Offset(2, 1.2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CReviewersDetails(),
          const SizedBox(height: 5),
          // review body
          Flexible(
            child: Text(
              'photo arrangement of delicious taco bread and ingredients',
              style: Styles.title14.copyWith(
                  color: greyColo3,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
          // helpful section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: greyColor2,
            ),
            child: const CHelpfulWidget(),
          ),
        ],
      ),
    );
  }
}
