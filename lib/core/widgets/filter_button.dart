import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const FilterButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<HomeCubit>(context).fetchFilterCars(context);
        BlocProvider.of<HomeCubit>(context).brand = 'Kia';
        BlocProvider.of<HomeCubit>(context).transmission = 'Automatic';
        BlocProvider.of<HomeCubit>(context).traction = 'Front';
        BlocProvider.of<HomeCubit>(context).type = 'Sedan';
        BlocProvider.of<HomeCubit>(context).minPrice = 100000;
        BlocProvider.of<HomeCubit>(context).maxPrice = 1000000;
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
