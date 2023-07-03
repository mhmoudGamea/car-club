import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/styles.dart';
import 'brand_list_view.dart';
import 'traction_list_view.dart';
import 'filter_button.dart';
import 'body_list_view.dart';
import 'price_list_view.dart';
import 'transmission_list_view.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Filters",
              style: Styles.title16.copyWith(
                color: const Color(0xff171820),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Brand",
            style: Styles.title16
                .copyWith(color: const Color(0xff171820), fontSize: 18),
          ),
          const SizedBox(height: 20),
          BrandListView(),
          const SizedBox(height: 20),
          Text(
            "Transmission",
            style: Styles.title16.copyWith(color: const Color(0xff171820)),
          ),
          const SizedBox(height: 20),
          TransmissionListView(),
          const SizedBox(height: 20),
          Text(
            "Traction",
            style: Styles.title16.copyWith(color: const Color(0xff171820)),
          ),
          const SizedBox(height: 20),
          TractionListView(),
          const SizedBox(height: 20),
          Text(
            "Body Type",
            style: Styles.title16.copyWith(color: const Color(0xff171820)),
          ),
          const SizedBox(height: 20),
          BodyListView(),
          const SizedBox(height: 20),
          Text(
            "Price",
            style: Styles.title16.copyWith(color: const Color(0xff171820)),
          ),
          const SizedBox(height: 20),
          const PriceListView(),
          const SizedBox(height: 20),
          const SizedBox(
            width: double.infinity,
            height: 50,
            child: FilterButton(
              text: "Filter",
              backgroundColor: mintGreen,
              textColor: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
