// import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/helper.dart';
import '../models/car_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  List<CarModel> cars = [];
  final List brands = [
    'kia',
    'chevrolet',
    'audi',
    'brilliance',
    'byd',
    'fiat',
    'ford',
    'geely',
    'haval',
    'honda',
    'hyundai',
    'jaguar',
    'jeep',
    'jetour',
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
  @override
  Future<Either<Failure, List<CarModel>>> fetchNewCars() async {
    try {
      cars = [];
      // var rng = Random();
      // var brandsIndex = List.generate(
      //   10,
      //   (index) => rng.nextInt(28),
      // );

      // var data1 = await FirebaseFirestore.instance
      //     .collection('cars')
      //     .doc('brands')
      //     .collection(brands[13])
      //     .get();
      // for (var element in data1.docs) {
      //   cars.add(CarModel.fromMap(element.data()));
      // }
      // var data2 = await FirebaseFirestore.instance
      //     .collection('cars')
      //     .doc('brands')
      //     .collection(brands[3])
      //     .get();
      // for (var element in data2.docs) {
      //   cars.add(CarModel.fromMap(element.data()));
      // }
      for (var i = 0; i < 28; i++) {
        await dataGeneration(
          brands: brands,
          // brandsIndex: brandsIndex,
          cars: cars,
          index: i,
        );
      }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> dataGeneration({
    required List<dynamic> brands,
    // required List<int> brandsIndex,
    required List<CarModel> cars,
    required int index,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection('cars')
        .doc('brands')
        .collection(brands[index])
        .get();
    for (var element in data.docs) {
      cars.add(CarModel.fromMap(element.data()));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> fetchSearchCars(
    String search,
    BuildContext context,
  ) async {
    try {
      List<CarModel> result = [];
      if (search.isEmpty) {
        Helper.showCustomToast(
            context: context,
            bgColor: babyBlue,
            icon: FontAwesomeIcons.circleCheck,
            msg: 'Please Enter Car Name');
      } else {
        result = cars
            .where(
                (car) => car.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
        if (result.isEmpty) {
          Helper.showCustomToast(
              context: context,
              bgColor: babyBlue,
              icon: FontAwesomeIcons.circleCheck,
              msg: 'Car Not Found');
        } else {
          cars = result;
        }
      }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> fetchFilterCars(
    BuildContext context,
    String brand,
    String transmission,
    String traction,
    String type,
    int minPrice,
    int maxPrice,
  ) async {
    try {
      List<CarModel> result = [];
      result = cars
          .where((car) =>
              car.brand.toLowerCase() == brand.toLowerCase() &&
              car.transmission == transmission &&
              car.traction == traction &&
              car.type == type &&
              car.price >= minPrice &&
              car.price <= maxPrice)
          .toList();
      if (result.isEmpty) {
        Helper.showCustomToast(
            context: context,
            bgColor: babyBlue,
            icon: FontAwesomeIcons.circleCheck,
            msg: 'Car Not Found');
      } else {
        cars = result;
      }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarModel>>> fetchFavCars() async {
    try {
      List<CarModel> cars = [];
      for (var i = 0; i < brands.length; i++) {
        var data = await FirebaseFirestore.instance
            .collection('cars')
            .doc('brands')
            .collection(brands[i])
            .get();
        for (var element in data.docs) {
          if (element['favorites'].contains(uId)) {
            cars.add(CarModel.fromMap(element.data()));
          }
        }
      }
      return right(cars);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateFavourites(
    CarModel car,
    bool isLiked,
    BuildContext context,
  ) async {
    try {
      CollectionReference carsCollectionRF = FirebaseFirestore.instance
          .collection('cars')
          .doc('brands')
          .collection(car.brand.toLowerCase());
      var data1 = await carsCollectionRF.get();
      for (var element in data1.docs) {
        if (element.id == car.model) {
          if (isLiked) {
            await carsCollectionRF.doc(element.id).update({
              'favorites': FieldValue.arrayUnion([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Added to your favourites');
            });
          } else {
            await carsCollectionRF.doc(element.id).update({
              'favorites': FieldValue.arrayRemove([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Removed from your favourites');
            });
          }
        }
      }
      return const Right(true);
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