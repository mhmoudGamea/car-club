import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_item_selector/simple_item_selector.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import '../constants.dart';

class TractionListView extends StatelessWidget {
  TractionListView({Key? key}) : super(key: key);
  final List traction = ['Front', 'Back', 'Four-wheel'];
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
        itemsCount: traction.length,
        items: traction
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
          BlocProvider.of<HomeCubit>(context).traction = traction[index!];
        },
      ),
    );
  }
}
