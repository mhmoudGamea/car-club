import 'package:car_club/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';

class PriceListView extends StatefulWidget {
  const PriceListView({Key? key}) : super(key: key);

  @override
  State<PriceListView> createState() => _PriceListViewState();
}

class _PriceListViewState extends State<PriceListView> {
  RangeValues _value = const RangeValues(100000, 1000000);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _value,
      min: 100000,
      max: 4000000,
      divisions: 40,
      activeColor: mintGreen,
      labels: RangeLabels(
        _value.start.round().toString(),
        _value.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _value = values;
          BlocProvider.of<HomeCubit>(context).minPrice = values.start.round();
          BlocProvider.of<HomeCubit>(context).maxPrice = values.end.round();
        });
      },
    );
  }
}
