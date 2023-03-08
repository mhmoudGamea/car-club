import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  const ColorItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      color: color,
      icon: const Icon(Icons.circle),
      iconSize: 40,
    );
  }
}
