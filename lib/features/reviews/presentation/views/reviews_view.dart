import 'package:flutter/material.dart';

import 'widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  static const String rn = '/reviewsView';
  const ReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ReviewsViewBody(),
      ),
    );
  }
}
