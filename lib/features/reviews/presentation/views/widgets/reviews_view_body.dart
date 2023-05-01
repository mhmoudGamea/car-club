import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_state.dart';
import 'package:car_club/features/reviews/presentation/views/widgets/c_go_review_button.dart';
import 'package:car_club/features/reviews/presentation/views/widgets/review_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<ReviewCubit>(context);
    return BlocConsumer<ReviewCubit,ReviewStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const CGoReviewButton(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                // physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                itemCount: 5,
                itemBuilder: (context, index) => const ReviewListItem(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}
