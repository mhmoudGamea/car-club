import 'package:car_club/core/constants.dart';
import 'package:car_club/features/home/presentation/views/home_view.dart';
import 'package:car_club/features/post/presentation/views/post_view.dart';
import 'package:car_club/features/used/presentation/views/used_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../features/favourite/presentation/views/favourite_view.dart';
import '../../features/services/presentation/views/services_view.dart';
import 'custom_app_bar.dart';
import 'drawer_widget.dart';

class TabsView extends StatefulWidget {
  static const rn = '/';
  const TabsView({Key? key}) : super(key: key);

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  var _currentIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {'screen': const HomeView()},
    {'screen': const UsedView()},
    {'screen': const ServicesView()},
    {'screen': const FavouriteView()},
  ];

  Map<String, dynamic> getScreen(int value) {
    return _screens.elementAt(value);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const Divider(color: secondaryDark),
            Expanded(
              child: getScreen(_currentIndex)['screen'],
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: Container(
        color: greyColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: GNav(
            gap: 8,
            color: Colors.black54,
            activeColor: whiteColor,
            tabBackgroundColor: mintGreen,
            padding: const EdgeInsets.all(13),
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.house,
                iconSize: 17,
                text: 'Home',
              ),
              GButton(
                icon: FontAwesomeIcons.retweet,
                iconSize: 17,
                text: 'Used',
              ),
              GButton(
                icon: FontAwesomeIcons.screwdriverWrench,
                iconSize: 17,
                text: 'Services',
              ),
              GButton(
                icon: FontAwesomeIcons.solidHeart,
                iconSize: 17,
                text: 'Favourite',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).push(PostView.rn);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: mintGreen,
              mini: true,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
