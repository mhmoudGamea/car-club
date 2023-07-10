import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/car_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  String brand = 'Kia';
  String transmission = 'Automatic';
  String traction = 'Front';
  String type = 'Sedan';
  int minPrice = 100000;
  int maxPrice = 1000000;

  Future<void> fetchNewCars() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchNewCars();
    result.fold(
      (failure) => emit(HomeFailure(failure.errMsg)),
      (cars) => emit(HomeSuccess(cars)),
    );
  }

  Future<void> fetchSearchCars(
    String search,
    BuildContext context,
  ) async {
    emit(HomeLoading());
    var result = await homeRepo.fetchSearchCars(search, context);
    result.fold(
      (failure) => emit(HomeFailure(failure.errMsg)),
      (cars) => emit(HomeSuccess(cars)),
    );
  }

  Future<void> fetchFilterCars(BuildContext context) async {
    emit(HomeLoading());
    var result = await homeRepo.fetchFilterCars(
      context,
      brand,
      transmission,
      traction,
      type,
      minPrice,
      maxPrice,
    );
    result.fold(
      (failure) => emit(HomeFailure(failure.errMsg)),
      (cars) => emit(HomeSuccess(cars)),
    );
  }

  Future<void> fetchFavCars() async {
    emit(FavLoading());
    var result = await homeRepo.fetchFavCars();
    result.fold(
      (failure) => emit(FavFailure(failure.errMsg)),
      (cars) => emit(FavSuccess(cars)),
    );
  }

  Future<void> updateFavourites(
    CarModel car,
    bool isLiked,
    BuildContext context,
  ) async {
    var result = await homeRepo.updateFavourites(car, isLiked, context);
    result.fold(
      (failure) => emit(IsFavouriteFailure(failure.errMsg)),
      (_) {},
    );
  }
}
