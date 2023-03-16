import 'package:flutter/material.dart';

import '../utils/assets.dart';
import 'brand_item.dart';

class BrandListView extends StatelessWidget {
  BrandListView({Key? key}) : super(key: key);
  // TODO: remove brand and add cont to class
  final List brands = [
    audi,
    bmw,
    byd,
    chery,
    chevrolet,
    citroen,
    fiat,
    ford,
    haval,
    honda,
    hyundai,
    jeep,
    jetour,
    kia,
    lada,
    mazda,
    mercedes,
    mg,
    miniCooper,
    mitsubishi,
    nissan,
    opel,
    peugeot,
    proton,
    renault,
    seat,
    skoda,
    subaru,
    suzuki,
    vw,
    volvo,
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
