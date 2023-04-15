import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String uId;
  late final String name;
  late final String email;
  late final String profileImage;
  late final String phone;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    this.profileImage = "",
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    phone = json['phone'];
    profileImage = json['profileImage'];
  }
  UserModel.fromFireStore(QueryDocumentSnapshot<Object?> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    profileImage = json['profileImage'];

    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phone': phone,
      'profileImage': profileImage,
    };
  }
}
