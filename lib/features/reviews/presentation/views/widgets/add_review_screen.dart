import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:flutter/material.dart';

import 'package:car_club/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);
  static const rn = '/AddReviewScreen/:id1/:id2';


  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {

  final double rate = 0.0;

  @override
  Widget build(BuildContext context) {


    // final carCenterCubit = BlocProvider.of<CarCenterCubit>(context);

    return BlocConsumer<ReviewCubit,ReviewStates>(
    listener: (context, state) {

      },
      builder: (context, state) {
        final cubit = BlocProvider.of<ReviewCubit>(context);
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          elevation: 1,
          title: const Text(
            "Share Reviews",
            style: Styles.title16,
          ),
          actions: [
            TextButton(
              onPressed: () {
                if(state is SuccessUploadReviewImage) {
                  cubit.addReview(context, "carCenterCubit.carCentersDocs[0]");
                }else if(state is FailureUploadReviewImage){
                  Helper.showCustomToast(context: context, bgColor: Colors.yellow, icon: FontAwesomeIcons.x, msg: "image upload failure");
                }
              },
              child: const Text("Share  "),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Share your experience at   Car Center Name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "help thousands of users benefits from your experience",
                style: Styles.title13.copyWith(color: greyColor),
              ),
              const SizedBox(height: 20),
              Text(
                "Rate Car Center Name",
                style: Styles.title15
                    .copyWith(fontWeight: FontWeight.w500, color: blackColor),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    itemCount: 5,
                    itemSize: 28,
                    unratedColor: greyColor,
                    itemPadding: const EdgeInsets.all(2.0),
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                        fill: 1,
                      );
                    },
                    onRatingUpdate: (value) {
                      cubit.setReviewRate(value);
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "${rate.toInt()}",
                        style: Styles.title16.copyWith(
                          fontSize: 45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text("/5"),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: greyColor,
                height: 2,
              ),
              const SizedBox(height: 20),
              Text(
                "Your review",
                style: Styles.title15
                    .copyWith(fontWeight: FontWeight.w500, color: blackColor),
              ),
              TextFormField(
                onFieldSubmitted: (value) {},
                controller: cubit.controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText:
                      "Write your review here. The best reviews are very descriptive and comprehensive",
                  hintMaxLines: 2,
                  hintStyle: TextStyle(color: greyColor, fontSize: 13),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: greyColor,
                height: 2,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Add Photos (Optional)",
                    style: Styles.title15
                        .copyWith(fontWeight: FontWeight.w500, color: blackColor),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      cubit.pickReviewImage(context: context).then((value) {
                        if(state is SuccessPickReviewImage) {
                          cubit.uploadReviewImage(image: cubit.file);
                        }else if(state is FailurePickReviewImage){
                          Helper.showCustomToast(context: context, bgColor: Colors.yellow, icon: FontAwesomeIcons.x, msg: "image pick failure");
                        }
                      });
                    },
                    child: Text(
                      "+ Add",
                      style: Styles.title15.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                  ),
                ],
              ),
              Text(
                "Add photos to your review to be more descriptive",
                style: Styles.title13.copyWith(color: greyColor),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
