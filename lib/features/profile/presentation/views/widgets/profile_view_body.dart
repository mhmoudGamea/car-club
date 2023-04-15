import 'package:car_club/features/profile/presentation/views/widgets/tabs/sells_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? name = '';
  String? phone = '';
  String? profileImage = '';
  Future _getDataFromDataBase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          phone = snapshot.data()!["phone"];
          profileImage = snapshot.data()!["profileImage"];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDataBase();
  }

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
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
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
                  Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffD8DADF)),
                      child: const Icon(
                        FontAwesomeIcons.camera,
                      ))
                ],
              ),
            ),
            Text(name!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "+2",
                  style:
                      TextStyle(color: greyColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  phone!,
                  style: const TextStyle(
                      color: greyColor, fontWeight: FontWeight.bold),
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
        SizedBox(height: 3000, child: TabBarView(children: tabsBarViews))
      ],
    );
  }
}
