import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../model_views/brand_cubit/brand_cubit.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandData = BlocProvider.of<BrandCubit>(context);
    List<dynamic> brandLogo = brandData.brands.entries.map((e) {
      return e.value;
    }).toList();
    List<String> brandName = brandData.brands.entries.map((e) {
      return e.key;
    }).toList();
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'Car Brands',
            backgroundColor: whiteColor,
            color: blackColor,
            fontSize: 14,
            iconSize: 18,
            elevation: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(children: [
              SizedBox(
                height: 60,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: brandLogo.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // print(_brandName[index]);
                      brandData.setBrandName = brandName[index];
                      GoRouter.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      brandLogo[index],
                      width: 40,
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
