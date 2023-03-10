import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/brand_cubit/brand_cubit.dart';
import 'dialog_text_field_widget.dart';

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
                        GoRouter.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        brandLogo[index],
                        width: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    'or you can type the color',
                    style: Styles.title13.copyWith(color: Colors.black),
                  ),
                ),
                DialogTextFieldWidget(
                  cursorColor: greyColor,
                  controller: brandData.getBrandController,
                  label: 'Brand name',
                  borderColor: greyColor,
                  onPress: () {
                    brandData.getBrandController.text = '';
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: NeumorphicButton(
                        onPressed: () {
                          // print(brandData.getBrandController.text);
                          brandData.setBrandName =
                              brandData.getBrandController.text;
                          brandData.getBrandController.text = '';
                          GoRouter.of(context).pop();
                        },
                        style: const NeumorphicStyle(
                          color: greyColor,
                          depth: 1,
                        ),
                        child: Text(
                          'Done',
                          style: Styles.title14.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
