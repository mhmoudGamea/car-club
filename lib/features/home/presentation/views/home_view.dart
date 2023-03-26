import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model_views/home_cubit/home_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  static const rn = '/homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchNewCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
