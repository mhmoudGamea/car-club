import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'brand_list_view.dart';
import 'color_list_view.dart';
import 'filter_app_bar.dart';
import 'fuel_list_view.dart';
import 'price_list_view.dart';
import 'transmission_list_view.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterAppBar(),
        Text(
          "Brand",
          style: Styles.title16
              .copyWith(color: const Color(0xff171820), fontSize: 18),
        ),
        const SizedBox(height: 15),
        BrandListView(),
        const SizedBox(height: 15),
        Text(
          "Transmission",
          style: Styles.title16.copyWith(color: const Color(0xff171820)),
        ),
        const SizedBox(height: 15),
        const TransmissionListView(),
        const SizedBox(height: 15),
        Text(
          "Color",
          style: Styles.title16.copyWith(color: const Color(0xff171820)),
        ),
        const SizedBox(height: 15),
        ColorListView(),
        const SizedBox(height: 15),
        Text(
          "Fuel Type",
          style: Styles.title16.copyWith(color: const Color(0xff171820)),
        ),
        const SizedBox(height: 15),
        const FuelListView(),
        const SizedBox(height: 15),
        Text(
          "Price",
          style: Styles.title16.copyWith(color: const Color(0xff171820)),
        ),
        const SizedBox(height: 15),
        const PriceListView(),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Filter"),
          ),
        ),
      ],
    );
  }
}
