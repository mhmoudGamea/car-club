import 'package:flutter/material.dart';

import 'filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 635,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const FilterViewBody(),
    );
  }
}
