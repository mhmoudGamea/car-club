import 'package:car_club/features/profile/presentation/model_view/profile_cubit.dart';
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const rn = '/profileView';
  const ProfileView({Key? key}) : super(key: key);
//  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // final data = BlocProvider.of<AppThemeCubit>(context);
    return DefaultTabController(
      length: 3,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UsedCubit()),
          BlocProvider(create: (context) => ProfileCubit()),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back_ios,
                //  color: blackColor,
                size: 21,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            title: Center(
                child: Text(
              "MyProfile",
              style: Styles.title16.copyWith(color: blackColor),
            )),
          ),
          body: ProfileViewBody(),
        ),
      ),
    );
  }
}
