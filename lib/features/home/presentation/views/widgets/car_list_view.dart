import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/car_item_box.dart';
import '../../model_views/home_cubit/home_cubit.dart';

class CarListView extends StatelessWidget {
  const CarListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarItemBox(car: state.cars[index]),
              ),
              itemCount: state.cars.length,
              physics: const BouncingScrollPhysics(),
            ),
          );
        } else if (state is HomeFailure) {
          return Text(state.errMsg);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
