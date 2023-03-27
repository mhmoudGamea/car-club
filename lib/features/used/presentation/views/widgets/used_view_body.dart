import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/used/presentation/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../home/presentation/views/widgets/car_box_item.dart';
import '../../model_views/used_cubit/used_cubit.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsedCubit, UsedState>(
      builder: (context, state) {
        if (state is UsedCarPostsSuccess) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            itemCount: state.posts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 15 / 21,
            ),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => GoRouter.of(context)
                    .push(DetailsView.rn, extra: state.posts[index]),
                child: CarBoxItem(model: state.posts[index])),
          );
        } else if (state is UsedCarPostsFailure) {
          return Text(
            state.error,
            style: Styles.title13.copyWith(color: blackColor),
          );
        } else {
          return Container(
            height: 10,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(left: 120, right: 120),
            child: const LinearProgressIndicator(
                color: mintGreen, backgroundColor: greyColor),
          );
        }
      },
    );
  }
}
