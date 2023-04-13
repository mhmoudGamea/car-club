import 'package:car_club/core/constants.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UserChatItem extends StatelessWidget {
  final UserModel userModel;
  const UserChatItem({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: userModel.profileImage.isEmpty
              ? null // TODO: put avatar image here
              : NetworkImage(userModel.profileImage),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(capitalize(userModel.name),
            style:
                Styles.title15.copyWith(color: blackColor, letterSpacing: 0.8)),
      ],
    );
  }
}

// function that will take name of user and make first letter capital
String capitalize(String text) {
  return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}
