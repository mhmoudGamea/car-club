import 'package:car_club/features/post/presentation/views/widgets/model_List_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
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
            child: Column(
              children: [
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
                        //GoRouter.of(context).pop();
                      },
                      child: Image.asset(
                        brandLogo[index],
                        width: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (brandData.getBrandName != null)
                  BlocBuilder<BrandCubit, BrandState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 150,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: brandData.getModelValues.length,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: greyColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  brandData.getBrandName!,
                                  style: Styles.title14
                                      .copyWith(color: Colors.black),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  brandData.getModelValues[index],
                                  style: Styles.title14
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        ),
                      );
                    },
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
