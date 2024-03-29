import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/views/widgets/c_reviewers_details.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../view_models/review_cubit/review_cubit.dart';
import '../../view_models/review_cubit/review_state.dart';
import 'c_helpful_widget.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem(
      {Key? key,
      required this.model,
      required this.doc,
      required this.carCenterModel})
      : super(key: key);
  final ReviewModel model;
  final String doc;
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
              CReviewersDetails(model: model, carCenterModel: carCenterModel),
              const SizedBox(height: 5),
              // review body
              Flexible(
                child: Text(
                  model.reviewText,
                  style: Styles.title14.copyWith(
                      color: greyColo3,
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              if (model.reviewImage!.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: model.reviewImage ?? "",
                  errorWidget: (context, url, error) {
                    return const Placeholder();
                  },
                  placeholder: (context, url) {
                    return const CircularProgressIndicator();
                  },
                ),
              if (model.reviewImage!.isNotEmpty) const SizedBox(height: 10),
              // helpful section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greyColor2,
                    ),
                    child: CHelpfulWidget(model: model, doc: doc),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: model.sentiment == 'Helpful'
                          ? babyBlue.withOpacity(0.4)
                          : Colors.red.withOpacity(0.4),
                    ),
                    child: model.sentiment == 'Helpful'
                        ? const Icon(
                            FontAwesomeIcons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : const Icon(
                            FontAwesomeIcons.exclamation,
                            size: 16,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
