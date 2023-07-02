
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';


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
      child: BlocProvider(
        create: (context) => UsedCubit(),
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
            title: const Center(
                child: Text(
              "MyProfile",

              // style: Styles.title16.copyWith(color: blackColor),
            )),
            actions: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(right: 10),
                icon: const Icon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  color: Colors.red,
                  size: 21,
                ),
                onPressed: () {

                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
          body: const ProfileViewBody(),
        ),
      ),
    );
  }
}
