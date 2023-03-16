import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class ModelListItem extends StatelessWidget {
  final String brandLogo;
  final String modelName;
  const ModelListItem(
      {Key? key, required this.brandLogo, required this.modelName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: greyColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 50,
            child: Image.asset(brandLogo, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Text(
            modelName,
            style: Styles.title14.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
