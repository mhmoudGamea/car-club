class MapServicesModel {
  late final String name;
  late final String phone_1;
  // late final String phone_2;
  late final String address;
  late final String services;
  late final String description;
  late final String location;
  late final String timeWork;

  MapServicesModel({
    required this.name,
    required this.phone_1,
    // required this.phone_2,
    required this.address,
    required this.services,
    required this.description,
    // required this.location,
    //  required this.timeWork,
  });

  MapServicesModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    services = json['services'];
    description = json['description'];
    //  location = json['location'];
    // timeWork = json['timeWork'];
    phone_1 = json['phone'];
    //phone_2= json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'services': services,
      'description': description,
      // 'location': location,
      //'timeWork': timeWork,
      'phone': phone_1,
      //'phone': phone_2,
    };
  }
}
