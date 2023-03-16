import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'filter_view.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({Key? key}) : super(key: key);

  void showFiltter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // backgroundColor: secondaryDark,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => const FilterView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 0.1,
        horizontal: 2,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: secondaryDark, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () => showFiltter(context),
        icon: SvgPicture.asset(
          filter,
          colorFilter: const ColorFilter.mode(secondaryDark, BlendMode.srcIn),
          width: 27,
        ),
      ),
    );
  }
}
