import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/reviews/data/models/review_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../services/data/models/car_center_model.dart';

class CReviewersDetails extends StatelessWidget {
  const CReviewersDetails({Key? key, required this.model, required this.carCenterModel}) : super(key: key);
  final ReviewModel model;
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // image section

    leading: carCenterModel.user.profileImage!.isNotEmpty ?InkWell(
      onTap: () {
        // GoRouter.of(context).push(
        //     ProfileView.rn
        // );

      },
      child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(model.user.profileImage??whiteImage),
          radius: 26,
        ),
    ) : InkWell(
      onTap: () {
        // GoRouter.of(context).push(
        //     ProfileView.rn
        // );

      },
      child: const CircleAvatar(
          backgroundColor: greyColor, radius: 26),
      ),

      // name section
      title: Text(
        model.user.name,
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
