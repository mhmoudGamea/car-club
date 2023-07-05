import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:car_club/features/services/presentation/view_models/services_cubit/car_centers_states.dart';
import 'package:car_club/features/services/presentation/view_models/services_cubit/services_cubit.dart';
import 'package:car_club/features/services/presentation/views/car_center_details.dart';
import 'package:flutter/material.dart';

import 'package:car_club/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../services/data/models/car_center_model.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen(
      {Key? key, required this.carCenterModel, required this.doc})
      : super(key: key);
  static const rn = '/AddReviewScreen';
  final CarCenterModel carCenterModel;
  final String doc;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ReviewCubit>(context);
        // final carCenterCubit = BlocProvider.of<CarCenterCubit>(context);

        return MultiBlocListener(
          listeners: [
            BlocListener<ReviewCubit, ReviewStates>(
              listener: (context, state) {
                if (state is SuccessAddReview) {
                  GoRouter.of(context)
                      .pushReplacement(CarCenterDetails.rn, extra: {
                    "doc": widget.doc,
                    "model": widget.carCenterModel,
                    "cubit1": context.read<CarCenterCubit>()
                  });
                } else if (state is FailureUploadReviewImage) {
                  Helper.showCustomToast(
                      context: context,
                      bgColor: Colors.yellow,
                      icon: FontAwesomeIcons.x,
                      msg: "image upload failure");
                }
              },
            ),
            BlocListener<CarCenterCubit, CarCentersStates>(
              listener: (context, state) {},
            ),
          ],
          child: Scaffold(
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
                if (cubit.press == false ||
                    state is SuccessUploadReviewImage ||
                    state is FailurePickReviewImage)
                  TextButton(
                    onPressed: () async {
                      if (cubit.rate == 0.0) {
                        Helper.showCustomToast(
                            context: context,
                            bgColor: Colors.red,
                            icon: FontAwesomeIcons.x,
                            msg: "please choice your rate");
                      } else if (cubit.getReviewTextController().text.isEmpty) {
                        Helper.showCustomToast(
                            context: context,
                            bgColor: Colors.red,
                            icon: FontAwesomeIcons.x,
                            msg: "please write your review");
                      } else {

                        await cubit
                            .addReview(context, widget.doc.toString(),
                                widget.carCenterModel,user)
                            .then((value) {
                          cubit.getReviews(carCenterDoc: widget.doc);
                          cubit.getCarCenterReviews(carCenterDoc: widget.doc);
                        });
                      }
                    },
                    child: const Text("Share  "),
                  ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state is LoadingAddReview ||
                        state is LoadingPickReviewImage ||
                        state is LoadingUploadReviewImage ||
                        (cubit.press == true &&
                            state is! SuccessUploadReviewImage &&
                            state is! FailurePickReviewImage))
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: LinearProgressIndicator(),
                      ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Share your experience at   Car Center Name",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
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
                      style: Styles.title15.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
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
                            // setState(() {});
                          },
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "${cubit.rate.toInt()}",
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
                      style: Styles.title15.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
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
                          style: Styles.title15.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () async {
                            setState(() async {
                              cubit.press = true;
                              await cubit
                                  .pickReviewImage(context: context)
                                  .then((value) async {
                                // TODO: what if i pick my image and return back i didn't want to share my review?
                                await cubit.uploadReviewImage(
                                    image: cubit.file!);
                              });
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
                    // if (cubit.getPickedImage == null)
                    Text(
                      "Add photos to your review to be more descriptive",
                      style: Styles.title13.copyWith(color: greyColor),
                    ),
                    // if (cubit.getPickedImage != null)
                    //   Container(
                    //     height: 250,
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         image: DecorationImage(
                    //             image: FileImage(cubit.getPickedImage!),
                    //             fit: BoxFit.cover)),
                    //   ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
