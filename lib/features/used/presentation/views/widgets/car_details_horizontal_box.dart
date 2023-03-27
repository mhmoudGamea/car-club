import 'package:car_club/features/used/presentation/views/widgets/column_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constants.dart';
import '../../../../post/data/models/post_model.dart';

class CraDetailsHorizontalBox extends StatelessWidget {
  CraDetailsHorizontalBox({
    super.key,
    required this.model,
  });
  final _format = NumberFormat('###,###,##0');
  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // first row
          Row(
            children: [
              ColumnDetail(type: 'Brand', value: model.brand),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: greyColor,
                  thickness: 2,
                ),
              ),
              ColumnDetail(type: 'Price', value: _format.format(model.price))
            ],
          ),
          const Divider(
            color: greyColor,
            thickness: 2,
          ),
          // second row
          Row(
            children: [
              ColumnDetail(type: 'Transmission', value: model.transmission),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: greyColor,
                  thickness: 2,
                ),
              ),
              ColumnDetail(type: 'Fuel Type', value: model.fuel),
            ],
          ),
          const Divider(
            color: greyColor,
            thickness: 2,
          ),
          // second row
          Row(
            children: [
              ColumnDetail(
                  type: 'Mileage', value: _format.format(model.mileage)),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: greyColor,
                  thickness: 2,
                ),
              ),
              ColumnDetail(type: 'Wheels Size', value: model.wheelSize),
            ],
          ),
        ],
      ),
    );
  }
}
