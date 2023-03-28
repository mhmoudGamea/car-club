import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:car_club/features/used/presentation/model_views/map_cubit/map_cubit.dart';
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  static const rn = '/detailsView';
  final PostModel model;
  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapCubit()..getOwnerLocation(model.address),
        ),
        BlocProvider(
          create: (context) => UsedCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(child: DetailsViewBody(model: model)),
      ),
    );
  }
}
