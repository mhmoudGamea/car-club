import 'package:flutter/material.dart';

class FavouriteBox extends StatelessWidget {
  final Color backGroundColor;
  final Color color;
  final IconData icon;
  const FavouriteBox(
      {Key? key,
      required this.backGroundColor,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        padding: const EdgeInsets.only(right: 0, top: 4),
        onPressed: () {},
        icon: Icon(icon, color: color),
      ),
    );
  }
}
