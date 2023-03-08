import 'package:flutter/material.dart';

class PriceListView extends StatefulWidget {
  const PriceListView({Key? key}) : super(key: key);

  @override
  State<PriceListView> createState() => _PriceListViewState();
}

class _PriceListViewState extends State<PriceListView> {
  RangeValues _value = const RangeValues(20000, 60000);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _value,
      min: 0,
      max: 100000,
      divisions: 20,
      labels: RangeLabels(
        _value.start.round().toString(),
        _value.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _value = values;
        });
      },
    );
  }
}
