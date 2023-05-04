import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../features/favourite/presentation/views/favourite_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/services/presentation/views/services_view.dart';
import '../../features/used/presentation/views/used_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: 270,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Margot Robbie'),
            accountEmail: const Text('email@gmail.com'),
            currentAccountPicture: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(ProfileView.rn);
              },
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile0.jpg',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: babyBlue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.house,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Home'),
            onTap: () => GoRouter.of(context).push(TabsView.rn),
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.retweet,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Used Cars'),
            onTap: () => GoRouter.of(context).push(UsedView.rn),
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.screwdriverWrench,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Services'),
            onTap: () => GoRouter.of(context).push(ServicesView.rn),
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Favorites'),
            onTap: () => GoRouter.of(context).push(FavouriteView.rn),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.car,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Car Suggestion'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.gear,
              size: 20,
              color: blackColor,
            ),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(
              FontAwesomeIcons.rightFromBracket,
              size: 20,
              color: blackColor,
            ),
            // leading: const Icon(Icons.exit_to_app),
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
