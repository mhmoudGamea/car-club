import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import '../constants.dart';

class BodyListView extends StatelessWidget {
  final List type = ['Sedan', 'SUV', 'Hatchback'];
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
        itemsCount: type.length,
        items: type
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
        onSelected: (index) {
          BlocProvider.of<HomeCubit>(context).type = type[index!];
        },
      ),
    );
  }
}
