import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ColumnDetail extends StatelessWidget {
  final String type;
  final String value;
  const ColumnDetail({Key? key, required this.type, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            type,
            style: Styles.title14.copyWith(color: Colors.grey),
          ),
          Text(
            value,
            style: Styles.title14.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
