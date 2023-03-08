import 'package:flutter/material.dart';

import 'color_item.dart';

class ColorListView extends StatelessWidget {
  ColorListView({Key? key}) : super(key: key);
  final List colors = [
    Colors.black,
    // Colors.white,
    Colors.grey,
    Colors.brown,
    Colors.blue,
    Colors.red,
    Colors.yellow,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemBuilder: (context, index) => ColorItem(
          color: colors[index],
        ),
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
