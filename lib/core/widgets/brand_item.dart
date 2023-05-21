import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  final String logo;
  const BrandItem({
    Key? key,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 50,
      padding: const EdgeInsets.all(3),
      child: Image.asset(
        logo,
        fit: BoxFit.cover,
      ),
    );
  }
}
