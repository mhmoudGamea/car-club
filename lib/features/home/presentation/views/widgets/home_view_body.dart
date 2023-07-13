import 'package:flutter/material.dart';

import '../../../../../core/widgets/search_filter_box.dart';
import 'car_grid_view.dart';
// import 'car_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: const [
        SizedBox(height: 10),
        SearchFilterBox(),
        SizedBox(height: 15),
        Expanded(child: CarGridView()),
      ],
    );
  }
}
