class UserModel {
  late final String uId;
  late final String name;
  late final String email;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
