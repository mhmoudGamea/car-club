import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/year_cubit/year_cubit.dart';

class YearWidget extends StatelessWidget {
  const YearWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manufacturingYear = BlocProvider.of<YearCubit>(context);
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Helper.normalAppBar(
            context: context,
            title: 'manufacturing Year',
            backgroundColor: whiteColor,
            color: blackColor,
            fontSize: 14,
            iconSize: 18,
            elevation: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 5),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: manufacturingYear.getManufacturingYears.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) => NeumorphicButton(
                      onPressed: () {
                        // print(manufacturingYear.getManufacturingYears[index]);
                        manufacturingYear.setManufactureYear =
                            manufacturingYear.getManufacturingYears[index];
                        GoRouter.of(context).pop();
                      },
                      style: const NeumorphicStyle(color: babyBlue, depth: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        '${manufacturingYear.getManufacturingYears[index]}',
                        style: Styles.title14.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
