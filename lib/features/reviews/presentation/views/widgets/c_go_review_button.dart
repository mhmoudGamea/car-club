import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../services/presentation/views/widgets/add_review_screen.dart';

class CGoReviewButton extends StatelessWidget {
  const CGoReviewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicButton(
            // onPressed: go to add review page,
            onPressed: () async {
              GoRouter.of(context).push(AddReviewScreen.rn);
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
    );
  }
}
