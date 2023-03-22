import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/core/widgets/car_item_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../home/presentation/views/widgets/car_box_item.dart';
import '../../model_views/used_cubit/used_cubit.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  Future<void> _refreshUsedCars(BuildContext context) async {
    await BlocProvider.of<UsedCubit>(context, listen: false).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<UsedCubit>(context).getPosts();
    return BlocBuilder<UsedCubit, UsedState>(
      builder: (context, state) {
        if (state is UsedCarPostsSuccess) {
          return RefreshIndicator(
            onRefresh: () => _refreshUsedCars(context),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                itemCount: state.posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 15 / 22,
                ),
                itemBuilder: (context, index) =>
                    CarBoxItem(image: state.posts[index].images[0])),

            // ListView.separated(
            //   physics: const BouncingScrollPhysics(),
            //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            //   itemCount: state.posts.length,
            //   itemBuilder: (context, index) =>
            //       CarItemBox(image: state.posts[index].images[0]),
            //   separatorBuilder: (context, index) => const SizedBox(height: 10),
            // ),
          );
        } else if (state is UsedCarPostsFailure) {
          return Text(
            state.error,
            style: Styles.title13.copyWith(color: blackColor),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: mintGreen),
          );
        }
      },
    );
  }
}
