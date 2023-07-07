import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/model_views/home_cubit/home_cubit.dart';
import '../../../../home/presentation/views/home_view_details.dart';
import '../../../../home/presentation/views/widgets/car_grid_item.dart';

class NewGridView extends StatelessWidget {
  const NewGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is FavSuccess) {
          return RefreshIndicator(
            onRefresh: () => BlocProvider.of<HomeCubit>(context).fetchFavCars(),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              itemCount: state.cars.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 15 / 20,
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
            ),
          );
        } else if (state is FavFailure) {
          return Text(state.errMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
