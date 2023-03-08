import 'package:flutter/material.dart';

import '../utils/assets.dart';
import 'brand_item.dart';

class BrandListView extends StatelessWidget {
  BrandListView({Key? key}) : super(key: key);
  final List brands = [
    bmwLogo,
    landRoverLogo,
    citroenLogo,
    fordLogo,
    miniLogo,
    mitsubishiLogo,
    skodaLogo,
    subaruLogo,
    teslaLogo,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => BrandItem(
          logo: brands[index],
        ),
        itemCount: brands.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
