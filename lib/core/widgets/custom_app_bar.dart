import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              // color: secondaryDark,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(FontAwesomeIcons.bars, size: 18),
            ),
          ),
          const Spacer(),
          Text(
            'Margot Robbie',
            style: Styles.title16.copyWith(color: Colors.black),
          ),
          const SizedBox(width: 10),
          // Container(
          //   width: 35,
          //   height: 35,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          //   child: GestureDetector(
          //     onTap: () {
          //       GoRouter.of(context).push(ProfileView.rn);
          //     },
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(5),
          //       child: user.profileImage!.isNotEmpty
          //           ? CachedNetworkImage(
          //               imageUrl: '${user.profileImage}',
          //               fit: BoxFit.cover,
          //             )
          //           : Image.asset(
          //               'assets/images/profile0.jpg',
          //               fit: BoxFit.cover,
          //             ),
          //     ),
          //   ),
          // ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(ProfileView.rn);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/profile0.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
