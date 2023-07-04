import 'dart:io';

import 'package:car_club/features/profile/presentation/model_view/profile_cubit.dart';
import 'package:car_club/features/profile/presentation/views/widgets/tabs/sells_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants.dart';

//import '../../model_view/profile_cubit.dart';
import 'tabs/feed_view.dart';
import 'tabs/fav_view.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({Key? key}) : super(key: key);

  // tabs
  final List<Widget> tabs = [
    //feed tab
    const Tab(
      icon: Icon(
        Icons.home,
        color: greyColor,
      ),
    ),
    // fav tab
    const Tab(
      icon: Icon(
        Icons.favorite,
        color: greyColor,
      ),
    ),
    // sells tab
    const Tab(
      icon: Icon(
        FontAwesomeIcons.cartArrowDown,
        color: greyColor,
      ),
    ),
  ];

  // tab bar views
  final List<Widget> tabsBarViews = [
    //feed view
    const FeedView(),
    // fav view
    const FavView(),
    // sells view
    const SellsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ProfileCubit>(context);
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 135,
                    width: 135,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(user.profileImage!),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: greyColor,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: mintGreen.withOpacity(0.5)),
                      child: IconButton(
                        onPressed: () async {
                          File? pickedFileImage = await data.pickProfileImage();
                          if (pickedFileImage != null) {
                            await data.uploadPickedImage(pickedFileImage);
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.camera, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'phone',
                  style:
                      TextStyle(color: babyBlue, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        //tab bar
        TabBar(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          indicatorColor: mintGreen,
          tabs: tabs,
        ),
        // tab bar view
        SizedBox(height: 3000, child: TabBarView(children: tabsBarViews))
      ],
    );
  }
}
