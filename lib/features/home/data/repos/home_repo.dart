import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/car_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CarModel>>> fetchNewCars();
}
