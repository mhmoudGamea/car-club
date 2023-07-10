import 'package:car_club/features/services/presentation/view_models/services_cubit/car_centers_states.dart';
import 'package:car_club/features/services/presentation/view_models/services_cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../car_center_details.dart';
import 'car_center_item_body.dart';

class CarCentersViewBody extends StatelessWidget {
  const CarCentersViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarCenterCubit, CarCentersStates>(

      builder: (context, state) {
        if (state is GetCarCentersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCarCentersSuccess) {
          return ListView.separated(
              itemBuilder: (context, index) => InkWell(
                  onTap: () {

                    GoRouter.of(context).push(
                        CarCenterDetails.rn,
                        extra: {
                          "doc":state.carCenterDoc[index],
                          "model":state.carCenters[index],
                          "cubit1":context.read<CarCenterCubit>()
                        }
                    );
                    //
                    // GoRouter.of(context).go(
                    //   '/CarCenterDetails/${state.carCenterDoc[index]}',
                    //   extra: {
                    //     "doc":state.carCenterDoc[index],
                    //     "model":state.carCenters[index],
                    //     "cubit1":context.read<CarCenterCubit>()
                    //   }
                    // //    state.carCenters[index]
                    // );

                  },
                  child: BlocProvider.value(
                        value: context.read<CarCenterCubit>(),
                        child: ItemViewBody(
                            carCenterModel: state.carCenters[index],
                          carCenterDoc: state.carCenterDoc[index],
                          rating:  state.rates[index],
                        ),
                      )
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10),
              itemCount: state.carCenters.length);
        } else if (state is GetCarCentersFailure) {
          return Center(
            widthFactor: 10,
            child: Text(
              state.error.toString(),
              maxLines: 1,
            ),
          );
        } else {
          return const Center(
            child: Text(
              "{Car Centers List View failure}",
            ),
          );
        }
      },
    );
  }
}
