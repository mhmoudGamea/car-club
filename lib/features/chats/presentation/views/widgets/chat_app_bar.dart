import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatAppBar extends StatelessWidget {
  final dynamic image;
  final String name;
  const ChatAppBar({Key? key, this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
        ),
      ),
      elevation: 1,
      titleSpacing: 5,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 10),
          Text(name,
              style: Styles.title15
                  .copyWith(fontWeight: FontWeight.bold, color: blackColor))
        ],
      ),
    );
  }
}
