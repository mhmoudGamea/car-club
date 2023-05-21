import 'package:flutter/material.dart';

import './search_box.dart';
import './filter_box.dart';

class SearchFilterBox extends StatelessWidget {
  const SearchFilterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBox(),
          const FilterBox(),
        ],
      ),
    );
  }
}
