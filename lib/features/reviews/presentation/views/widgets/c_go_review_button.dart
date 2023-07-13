import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../services/data/models/car_center_model.dart';
import '../../../../services/presentation/view_models/services_cubit/services_cubit.dart';
import 'add_review_screen.dart';

class CGoReviewButton extends StatelessWidget {
  const CGoReviewButton({Key? key, required this.carCenterModel, required this.doc}) : super(key: key);
  final CarCenterModel carCenterModel;
  final String doc;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ReviewCubit, ReviewStates>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: NeumorphicButton(
                  // onPressed: go to add review page,
                  onPressed: () async {

                    GoRouter.of(context).push(
                        AddReviewScreen.rn,
                        extra: {
                          "cubit1":context.read<CarCenterCubit>(),
                          "cubit2":context.read<ReviewCubit>(),
                          "doc":doc,
                          "model":carCenterModel,
                        }
                    );

                    // context.go(
                    //   '/AddReviewScreen/$doc',
                    //   extra: carCenterModel
                    // );

                },
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  style: const NeumorphicStyle(color: mintGreen, depth: 1),
                  child: Text(
                    'Add Review',
                    textAlign: TextAlign.center,
                    style: Styles.title15.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                const Text('Reviews',style: TextStyle(fontSize: 20,color: blackColor)),
                const Spacer(),
                PopupMenuButton(
                  icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem<int>(
                        value: 0,
                        height: 9,
                        child: Text("Most HelpFul                "),
                      ),
                    ];
                  },
                  onSelected: (value) async {
                    if (value == 0) {
                      await BlocProvider.of<ReviewCubit>(context).getSortedReviews(carCenterDoc: doc);
                    }
                  },
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
