import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import 'filter_view.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({Key? key}) : super(key: key);

  // TODO: put this function into helper class
  void showFiltter(BuildContext context, HomeCubit homeCubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // backgroundColor: secondaryDark,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => BlocProvider.value(
        value: homeCubit,
        child: const FilterView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[600]!, width: 0.8),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () => showFiltter(
          context,
          homeCubit,
        ),
        icon: Icon(
          FontAwesomeIcons.filter,
          size: 18,
          color: Colors.grey[600]!,
        ),
      ),
    );
  }
}
