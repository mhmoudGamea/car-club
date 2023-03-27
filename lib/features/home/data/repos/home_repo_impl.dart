import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/car_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<CarModel>>> fetchNewCars() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('cars')
          .doc('brands')
          .collection('kia')
          .get();
      final docs = data.docs;
      List<CarModel> cars = [];
      for (var element in docs) {
        cars.add(CarModel.fromMap(element.data()));
      }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// try {
//       var data = await FirebaseFirestore.instance
//           .collection('cars')
//           .doc('brands')
//           .collection('kia')
//           .get();
//       final docs = data.docs;
//       List<CarModel> cars = [];
//       for (var element in docs) {
//         cars.add(CarModel.fromMap(element.data()));
//       }
//       return right(cars);
//     } 