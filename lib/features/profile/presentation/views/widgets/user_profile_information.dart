import 'dart:io';

import 'package:car_club/core/utils/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../data/models/user_model.dart';
import '../../model_view/profile_cubit.dart';

class UserProfileInformation extends StatelessWidget {
  const UserProfileInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<ProfileCubit>(context);
    final firebase = FirebaseFirestore.instance.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: firebase,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 180),
              child: const CircularProgressIndicator());
        }
        UserModel userModel = data.getUserFromSnapshot(snapshot.data);
        return Column(
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
                          image: NetworkImage(userModel.profileImage!),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: greyColor,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: greyColo3.withOpacity(0.5)),
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
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
              userModel.name,
              style: Styles.title15.copyWith(color: blackColor),
            ),
            const SizedBox(height: 5),
            Text(
              "0${userModel.phone}",
              style: Styles.title14.copyWith(color: Colors.grey),
            ),
          ],
        );
      }),
    );
  }
}
