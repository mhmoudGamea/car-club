import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'fav',
        style: Styles.title13,
      ),
    );
  }
}
