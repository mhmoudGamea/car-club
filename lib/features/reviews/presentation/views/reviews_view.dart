import 'package:car_club/features/reviews/data/repos/review_repo_imple.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/data/models/car_center_model.dart';
import 'widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  static const String rn = '/reviewsView';
  const ReviewsView({Key? key,required this.carCenterModel, required this.doc}) : super(key: key);
  final CarCenterModel carCenterModel;
  final String doc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewCubit>(
      create: (context) => ReviewCubit(reviewRepo: ReviewRepoImple()),
      child:  Scaffold(
        body: SafeArea(
          child: ReviewsViewBody(carCenterModel: carCenterModel,doc:doc),
        ),
      ),
    );
  }
}
