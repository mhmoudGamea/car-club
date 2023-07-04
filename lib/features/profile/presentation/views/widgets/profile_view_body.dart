import 'package:car_club/features/profile/presentation/views/widgets/user_profile_information.dart';
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
        color: blackColor,
      ),
    ),
    // fav tab
    const Tab(
      icon: Icon(
        Icons.favorite,
        color: blackColor,
      ),
    ),
  ];

  // tab bar views
  final List<Widget> tabsBarViews = [
    //feed view
    const FeedView(),
    // fav view
    const FavView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const UserProfileInformation(),
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
