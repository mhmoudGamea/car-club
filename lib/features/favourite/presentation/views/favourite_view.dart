import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  static const rn = '/FavouriteView';
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsedCubit(),
      child: const Scaffold(
        body: FavouriteViewBody(),
      ),
    );
  }
}
