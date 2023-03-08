import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      padding: const EdgeInsets.only(right: 15),
      child: SvgPicture.asset(
        logo,
        fit: BoxFit.cover,
      ),
    );
  }
}
