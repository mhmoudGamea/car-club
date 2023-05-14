import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';
import '../models/car_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CarModel>>> fetchNewCars();
  Future<Either<Failure, List<CarModel>>> fetchFavCars();
  Future<Either<Failure, List<CarModel>>> fetchSearchCars(
    String search,
    BuildContext context,
  );
  Future<Either<Failure, bool>> updateFavourites(
    CarModel car,
    bool isLiked,
    BuildContext context,
  );
}
