
class UserModel {
  String uId;
  String name;
  String email;
  String? profileImage;
  String phone;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    this.profileImage ,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
   return UserModel(
       email : json['email'],
       name : json['name'],
       uId : json['uId'],
       phone : json['phone'],
       profileImage : json['profileImage']!,
   );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'phone': phone,
      'profileImage': profileImage!,
    };
  }
}
