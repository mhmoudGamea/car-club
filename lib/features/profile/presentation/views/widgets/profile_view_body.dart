


import 'package:car_club/features/profile/presentation/views/widgets/tabs/sells_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
  String? profileImage = ""  ;
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
                    decoration:   const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/cover.jpg'),
                          //    : FileImage(profileImage as File  )as ImageProvider,
                          //profileImage == null ?
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
                      child: IconButton(  onPressed: () {
                      //  ProfileCubit.get(context).getProfileImage();
                      },
                        icon:const Icon(FontAwesomeIcons.camera, size: 18), ),
                    ),
                  ),
                ],
              ),
            ),
            Text(name!, style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Text(
                //   "+2",
                //   style: Theme.of(context).textTheme.titleSmall,
                //  // style: TextStyle(color: greyColor, fontWeight: FontWeight.bold),
                // ),
                Text(
                  phone!,

                  style: const TextStyle(color: babyBlue, fontWeight: FontWeight.bold),
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
