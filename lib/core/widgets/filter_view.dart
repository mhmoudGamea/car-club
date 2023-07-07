import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import 'filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 635,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // child: const FilterViewBody(),
      child: BlocProvider(
        create: (context) => HomeCubit(HomeRepoImpl()),
        child: const FilterViewBody(),
      ),
    );
  }
}
