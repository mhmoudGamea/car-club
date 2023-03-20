import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model_views/used_cubit/used_cubit.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<UsedCubit>(context).getPosts();
    return BlocBuilder<UsedCubit, UsedState>(
      builder: (context, state) {
        if (state is UsedCarPostsSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            itemCount: state.posts.length,
            itemBuilder: (context, index) => Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  state.posts[index].images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          );
        } else if (state is UsedCarPostsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: babyBlue),
          );
        } else {
          return const Center(
            child: Text('Errooooooooooooooooor'),
          );
        }
      },
    );
  }
}
