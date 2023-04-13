import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/utils/assets.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);
  final List<Widget> tabs = const [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: MasonryGridView.builder(
        itemCount: tabs.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(i_0),
          ),
        ),
      ),
    );
  }
}
