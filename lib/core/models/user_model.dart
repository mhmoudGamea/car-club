import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String uId;
  late final String name;
  late final String email;
  late final String profileImage;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    this.profileImage = "",
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }
  UserModel.fromFireStore(QueryDocumentSnapshot<Object?> json) {
    email = json['email'];
    name = json['name'];
    profileImage = json['profileImage'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'profileImage': profileImage,
    };
  }
}
