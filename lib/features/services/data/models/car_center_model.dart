import 'opening_times.dart';

class CarCenterModel {
  final String uId;
  final String date;
  final String name;
  final String description;
  final String address;
  final String phone;
  final String phone2;
  final OpeningTimes openingTimes;
  final List<dynamic> images;
  final double distance;
  final int time;
  final double latitude;
  final double longitude;
  final bool credit;
  final bool offers;


  const CarCenterModel({
    required this.credit,
    required this.offers,
    required this.uId,
    required this.latitude,
    required this.longitude,
    required this.date,
    required this.name,//
    required this.description,
    required this.address,
    required this.phone,
    required this.phone2,
    required this.openingTimes,//
    required this.images,
    required this.distance,//
    required this.time
  });

  factory CarCenterModel.fromJson(Map<String, dynamic> json) {
    return CarCenterModel(
      uId: json['uId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      time: json['time'],
      distance: json['distance'],
      date: json['date'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      phone2: json['phone2'],
      openingTimes: OpeningTimes.fromJson(json['openingTimes']),
      images: json['images'],
      credit: json['credit'],
      offers : json['offers'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId':uId,
      'credit': credit,
      'offers':offers,
      'date': date,
      'name': name,
      'description': description,
      'address': address,
      'phone': phone,
      'phone2': phone2,
      'openingTimes' : openingTimes.toMap(),
      'images': images,
      'distance':distance,
      'time':time,
      'latitude':latitude,
      'longitude':longitude,
    };
  }

}
