import 'package:flutter/material.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

import '../constants.dart';

class BodyListView extends StatelessWidget {
  final List body = ['Sedan', 'SUV', 'Hatchback'];
  BodyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ItemSelector(
        direction: Direction.horizontal,
        activeBackgroundColor: mintGreen,
        inactiveBackgroundColor: Colors.white,
        itemMargin: const EdgeInsets.symmetric(horizontal: 10),
        itemPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBorderRadius: const BorderRadius.all(Radius.circular(5)),
        itemsCount: body.length,
        items: body
            .map(
              (e) => Container(
                alignment: Alignment.center,
                width: 60,
                child: Text(e),
              ),
            )
            .toList(),
        onSelected: (index) {},
      ),
    );
  }
}
