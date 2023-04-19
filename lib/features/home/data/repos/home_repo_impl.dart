import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../models/car_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<CarModel>>> fetchNewCars() async {
    try {
      var rng = Random();
      var brandsIndex = List.generate(
        10,
        (index) => rng.nextInt(28),
      );
      final List brands = [
        'audi',
        'brilliance',
        'byd',
        'chevrolet',
        'fiat',
        'ford',
        'geely',
        'haval',
        'honda',
        'hyundai',
        'jaguar',
        'jeep',
        'jetour',
        'kia',
        'mazda',
        'mg',
        'mini',
        'mitsubishi',
        'nissan',
        'opel',
        'peugeot',
        'proton',
        'renault',
        'seat',
        'skoda',
        'subaru',
        'toyota',
        'volvo',
      ];
      List<CarModel> cars = [];
      var data1 = await FirebaseFirestore.instance
          .collection('cars')
          .doc('brands')
          .collection(brands[13])
          .get();
      for (var element in data1.docs) {
        cars.add(CarModel.fromMap(element.data()));
      }
      var data2 = await FirebaseFirestore.instance
          .collection('cars')
          .doc('brands')
          .collection(brands[3])
          .get();
      for (var element in data2.docs) {
        cars.add(CarModel.fromMap(element.data()));
      }
      // for (var i = 0; i < 10; i++) {
      //   await dataGeneration(
      //     brands: brands,
      //     brandsIndex: brandsIndex,
      //     cars: cars,
      //     index: i,
      //   );
      // }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> dataGeneration({
    required List<dynamic> brands,
    required List<int> brandsIndex,
    required List<CarModel> cars,
    required int index,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection('cars')
        .doc('brands')
        .collection(brands[brandsIndex[index]])
        .get();
    for (var element in data.docs) {
      cars.add(CarModel.fromMap(element.data()));
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