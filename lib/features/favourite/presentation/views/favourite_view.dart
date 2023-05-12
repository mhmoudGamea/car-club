import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/model_views/home_cubit/home_cubit.dart';
import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatefulWidget {
  static const rn = '/FavouriteView';
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchFavCars();
    super.initState();
  }

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
