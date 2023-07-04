import 'package:car_club/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

class TransmissionListView extends StatelessWidget {
  final List transmission = ['Automatic', 'CVT', 'DSG'];
  TransmissionListView({Key? key}) : super(key: key);

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
        itemsCount: transmission.length,
        items: transmission
            .map(
              (e) => Container(
                alignment: Alignment.center,
                width: 60,
                child: FittedBox(
                  child: Text(e),
                ),
              ),
            )
            .toList(),
        onSelected: (index) {},
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     FilterButton(
    //       text: "Automatic",
    //       backgroundColor: mintGreen,
    //       textColor: whiteColor,
    //     ),
    //     FilterButton(
    //       text: "Tiptronic",
    //       backgroundColor: whiteColor,
    //       textColor: textButtonColor,
    //     ),
    //     FilterButton(
    //       text: "Manual",
    //       backgroundColor: whiteColor,
    //       textColor: textButtonColor,
    //     ),
    //   ],
    // );
  }
}
