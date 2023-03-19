import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UsedCubit>(context).getPost();
    return BlocBuilder<UsedCubit, UsedState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          itemCount: 7,
          itemBuilder: (context, index) => Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: babyBlue,
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }
}
