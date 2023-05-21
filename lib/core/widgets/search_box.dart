import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import '../constants.dart';
import '../utils/styles.dart';

class SearchBox extends StatelessWidget {
  final searchController = TextEditingController();
  SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[600]!, width: 0.8)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () =>
                      BlocProvider.of<HomeCubit>(context).fetchSearchCars(
                    searchController.text,
                    context,
                  ),
                  icon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 18,
                    color: Colors.grey[600]!,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .62,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey[600]!, width: 0.8),
                  ),
                ),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) =>
                      BlocProvider.of<HomeCubit>(context).fetchSearchCars(
                    value,
                    context,
                  ),
                  cursorColor: secondaryDark,
                  decoration: InputDecoration(
                    //fillColor: Color(0xff64636A),
                    hintText: 'Find your suitable car',
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    hintStyle: Styles.titleSmall.copyWith(
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff64636A),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
