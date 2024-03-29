import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class CHelpfulWidget extends StatelessWidget {
  const CHelpfulWidget({Key? key, required this.model, required this.doc})
      : super(key: key);
  final ReviewModel model;
  final String doc;
  @override
  Widget build(BuildContext context) {
    ReviewCubit cubit = BlocProvider.of<ReviewCubit>(context);

    return BlocConsumer<ReviewCubit, ReviewStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LikeButton(
            bubblesColor: const BubblesColor(
              dotPrimaryColor: mintGreen,
              dotSecondaryColor: babyBlue,
              dotThirdColor: greyColor,
            ),
            onTap: (isLiked) async {
              await cubit.clickHelpful(model: model, doc: doc);
              // await cubit.getLikedReviews();
              return cubit.isLikedBefore(doc);

              // return _isLiked;
            },
            isLiked: cubit.isLikedBefore(doc),
            size: 22,
            likeBuilder: (bool isLiked) {
              return Icon(
                cubit.isLikedBefore(doc)
                    ? FontAwesomeIcons.solidThumbsUp
                    : FontAwesomeIcons.thumbsUp,
                color: mintGreen,
                size: 18,
              );
            },
            // likeCount: widget.model.favourites.length,
            likeCount: model.helpfulCount,
            likeCountPadding: EdgeInsets.zero,
            countPostion: CountPostion.right,
            countBuilder: (int? count, bool isLiked, String text) {
              // var color = isLiked ? blackColor : greyColor;
              Widget result;
              if (model.helpfulCount == 0) {
                result = Text(
                  "${model.helpfulCount}",
                  style: const TextStyle(color: greyColor),
                );
              } else {
                result = Text(
                  text,
                  style: const TextStyle(color: blackColor),
                );
              }
              return result;
            },
          ),
          const SizedBox(width: 5),
          Text(
            'Helpful',
            style: Styles.title13.copyWith(
              color: blackColor,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
      },
    );
  }
}
