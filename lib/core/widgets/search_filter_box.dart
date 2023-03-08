import 'package:flutter/material.dart';

import './search_box.dart';
import './filter_box.dart';

class SearchFilterBox extends StatelessWidget {
  const SearchFilterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SearchBox(),
        FilterBox(),
      ],
    );
  }
}
