import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class CarModel {
  final String brand;
  final String model;
  final int price;
  final String motor;
  final int speed;
  final int year;
  final String transmission;
  final String fuel;
  final int horsepower;
  final int maxspeed;
  final int height;
  final double acceleration;
  final int length;
  final int width;
  final int wheelbase;
  final String traction;
  final int seats;
  final int cylinder;
  final String type;
  final List<dynamic> images;
  final List<dynamic> favorites;

  const CarModel({
    required this.brand,
    required this.model,
    required this.price,
    required this.motor,
    required this.speed,
    required this.year,
    required this.transmission,
    required this.fuel,
    required this.horsepower,
    required this.maxspeed,
    required this.height,
    required this.acceleration,
    required this.length,
    required this.width,
    required this.wheelbase,
    required this.traction,
    required this.seats,
    required this.cylinder,
    required this.type,
    required this.images,
    required this.favorites,
  });

  factory CarModel.fromMap(Map<String, dynamic> data) => CarModel(
        brand: data['brand'] as String,
        model: data['model'] as String,
        price: data['price'] as int,
        motor: data['motor'] as String,
        speed: data['speed'] as int,
        year: data['year'] as int,
        transmission: data['transmission'] as String,
        fuel: data['fuel'] as String,
        horsepower: data['horsepower'] as int,
        maxspeed: data['maxspeed'] as int,
        height: data['height'] as int,
        acceleration: (data['acceleration'] as num).toDouble(),
        length: data['length'] as int,
        width: data['width'] as int,
        wheelbase: data['wheelbase'] as int,
        traction: data['traction'] as String,
        seats: data['seats'] as int,
        cylinder: data['cylinder'] as int,
        type: data['type'] as String,
        images: data['images'] as List<dynamic>,
        favorites: data['favorites'] as List<dynamic>,
      );

  Map<String, dynamic> toMap() => {
        'brand': brand,
        'model': model,
        'price': price,
        'motor': motor,
        'speed': speed,
        'year': year,
        'transmission': transmission,
        'fuel': fuel,
        'horsepower': horsepower,
        'maxspeed': maxspeed,
        'height': height,
        'acceleration': acceleration,
        'length': length,
        'width': width,
        'wheelbase': wheelbase,
        'traction': traction,
        'seats': seats,
        'cylinder': cylinder,
        'type': type,
        'images': images,
        'favorites': favorites,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CarModel].
  factory CarModel.fromJson(String data) {
    return CarModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CarModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
