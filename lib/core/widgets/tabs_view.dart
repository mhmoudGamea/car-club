import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/home/presentation/views/home_view.dart';
import 'package:car_club/features/post/presentation/views/post_view.dart';
import 'package:car_club/features/profile/presentation/model_view/profile_cubit.dart';
import 'package:car_club/features/used/presentation/views/used_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../features/favourite/presentation/views/favourite_view.dart';
import '../../features/services/presentation/views/services_view.dart';
import 'custom_app_bar.dart';
import 'drawer_widget.dart';

class TabsView extends StatefulWidget {
  static const rn = '/TabsView';
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
    return BlocProvider(
      create: (context) => ProfileCubit()..getUsers(),
      child: BlocListener<ProfileCubit,ProfileState>(
        listener: (context, state) async {
          if(state is GetUsersSuccess){
            await BlocProvider.of<ProfileCubit>(context).getUser(uId: uId);
            print(user.name.toString());
          }
        },
        child: Scaffold(
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
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[700]!,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // left of floating action button
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.house,
                                size: 15,
                                color: _currentIndex == 0 ? mintGreen : blackColor),
                            const SizedBox(height: 3),
                            Text(
                              'Home',
                              style: Styles.title13.copyWith(
                                  color: _currentIndex == 0
                                      ? mintGreen
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.retweet,
                                size: 16,
                                color: _currentIndex == 1 ? mintGreen : blackColor),
                            const SizedBox(height: 3),
                            Text(
                              'Used',
                              style: Styles.title13.copyWith(
                                  color: _currentIndex == 1
                                      ? mintGreen
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      //right of floating action button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.screwdriverWrench,
                                size: 16,
                                color: _currentIndex == 2 ? mintGreen : blackColor),
                            const SizedBox(height: 3),
                            Text(
                              'Service',
                              style: Styles.title13.copyWith(
                                  color: _currentIndex == 2
                                      ? mintGreen
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = 3;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(FontAwesomeIcons.solidHeart,
                                size: 16,
                                color: _currentIndex == 3 ? mintGreen : blackColor),
                            const SizedBox(height: 3),
                            Text(
                              'Favourite',
                              style: Styles.title13.copyWith(
                                  color: _currentIndex == 3
                                      ? mintGreen
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push(PostView.rn);
            },
            backgroundColor: mintGreen,
            elevation: 2,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: whiteColor,
              child: Icon(Icons.add, color: mintGreen),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
/*

decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700]!,
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(2, 2),
            ),
          ],
        ),
*/

/*

Container(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: GNav(
            gap: 10,
            color: blackColor,
            activeColor: whiteColor,
            tabBackgroundColor: mintGreen,
            padding: const EdgeInsets.all(10),
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
      )

*/
