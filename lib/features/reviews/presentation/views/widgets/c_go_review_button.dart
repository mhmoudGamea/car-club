import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'add_review_screen.dart';

class CGoReviewButton extends StatelessWidget {
  const CGoReviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit,ReviewStates>(
      listener: (context, state) {

      },
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: NeumorphicButton(
              // onPressed: go to add review page,
              onPressed: () async {
                // context.read<ReviewCubit>()
                // from here not from app_routes.dart for the right context
                GoRouter.of(context).push(
                  AddReviewScreen.rn,
                  extra: context.read<ReviewCubit>(),
                );
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
    );
  }
}
