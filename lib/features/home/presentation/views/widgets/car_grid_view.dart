import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../model_views/home_cubit/home_cubit.dart';
import '../home_view_details.dart';
import 'car_grid_item.dart';

class CarGridView extends StatelessWidget {
  const CarGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            itemCount: state.cars.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 15 / 21,
            ),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    HomeViewDetails.rn,
                    extra: state.cars[index],
                  );
                },
                child: CarGridItem(
                  car: state.cars[index],
                )),
          );
          ;
        } else if (state is HomeFailure) {
          return Text(state.errMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// return GridView.builder(
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
//           itemCount: posts.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 15 / 21,
//           ),
//           itemBuilder: (context, index) => GestureDetector(
//               onTap: () {
//                 GoRouter.of(context).push(DetailsView.rn, extra: posts[index]);
//               },
//               child: CarBoxItem(model: posts[index])),
//         );