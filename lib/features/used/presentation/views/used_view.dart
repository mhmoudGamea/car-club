import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model_views/used_cubit/used_cubit.dart';
import 'widgets/used_view_body.dart';

class UsedView extends StatelessWidget {
  const UsedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsedCubit(),
      child: const UsedViewBody(),
    );
  }
}
