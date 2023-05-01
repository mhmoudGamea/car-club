import 'package:car_club/features/reviews/data/repos/review_repo_imple.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  static const String rn = '/reviewsView';
  const ReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (context) => ReviewCubit(reviewRepo: ReviewRepoImple()),
      child: const Scaffold(
        body: SafeArea(
          child: ReviewsViewBody(),
        ),
      ),
    );
  }
}
