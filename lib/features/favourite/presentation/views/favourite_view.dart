import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model_views/favourite_cubit/favourite_cubit.dart';
import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsedCubit()),
        BlocProvider(create: (context) => FavouriteCubit())
      ],
      child: const FavouriteViewBody(),
    );
  }
}
