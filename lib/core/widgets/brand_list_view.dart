import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

import '../utils/assets.dart';
import 'brand_item.dart';

class BrandListView extends StatelessWidget {
  BrandListView({Key? key}) : super(key: key);
  // ignore: todo
  // TODO: remove brand and add cont to class
  final List brands = [
    audi,
    brilliance,
    byd,
    chevrolet,
    fiat,
    ford,
    geely,
    haval,
    honda,
    hyundai,
    jaguar,
    jeep,
    jetour,
    kia,
    mazda,
    mg,
    mini,
    mitsubishi,
    nissan,
    opel,
    peugeot,
    proton,
    renault,
    seat,
    skoda,
    subaru,
    toyota,
    volvo,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ItemSelector(
        direction: Direction.horizontal,
        activeBackgroundColor: mintGreen,
        inactiveBackgroundColor: Colors.white10,
        // itemMargin: const EdgeInsets.all(2.0),
        itemPadding: EdgeInsets.zero,
        itemBorderRadius: const BorderRadius.all(Radius.circular(5)),
        itemsCount: brands.length,
        items: brands.map((e) => BrandItem(logo: e)).toList(),
        onSelected: (index) {
          print(index);
        },
      ),
    );
    // return SizedBox(
    //   height: 50,
    //   child: ListView.builder(
    //     physics: const BouncingScrollPhysics(),
    //     itemBuilder: (context, index) => BrandItem(
    //       logo: brands[index],
    //     ),
    //     itemCount: brands.length,
    //     scrollDirection: Axis.horizontal,
    //   ),
    // );
  }
}
