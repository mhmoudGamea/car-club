import 'package:car_club/features/reviews/presentation/views/widgets/c_go_review_button.dart';
import 'package:car_club/features/reviews/presentation/views/widgets/review_list_item.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        ],
      ),
    );
  }
}
