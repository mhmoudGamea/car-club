
import 'package:car_club/features/profile/presentation/views/widgets/tabs/sells_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants.dart';
import 'tabs/feed_view.dart';
import 'tabs/fav_view.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
CollectionReference userRef= FirebaseFirestore.instance.collection("usersPosts");

  // tabs
  final List<Widget> tabs = const [
    //feed tab
    Tab(
      icon: Icon(
        Icons.home,
        color: greyColor,
      ),
    ),
    // fav tab
    Tab(
      icon: Icon(
        Icons.favorite,
        color: greyColor,
      ),
    ),
    // sells tab
    Tab(
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
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/cover.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  color: greyColor,
                ),
              ),
            ),
            const Text("tawhed"
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "+20",
                  style:
                      TextStyle(color: greyColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  "1007436737",
                  style:
                      TextStyle(color: greyColor, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        //tab bar
        TabBar(
          tabs: tabs,
        ),
        // tab bar view
        SizedBox(height:3000 , child: TabBarView(children: tabsBarViews))
      ],
    );
  }
}
