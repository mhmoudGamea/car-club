import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../model_views/vehicle_type_cubit/vehicle_type_cubit.dart';

class VehicleTypeWidget extends StatelessWidget {
  const VehicleTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicleType = BlocProvider.of<VehicleTypeCubit>(context);
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
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  vehicleType.getVehicleTypesList.length,
                  (index) => NeumorphicButton(
                    onPressed: () {
                      vehicleType.setvehicleType =
                          vehicleType.getVehicleTypesList[index];
                      GoRouter.of(context).pop();
                    },
                    style: const NeumorphicStyle(
                        color: Color(0xffaaa69d), depth: 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      vehicleType.getVehicleTypesList[index],
                      style: Styles.title14.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
