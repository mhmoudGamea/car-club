class PostModel {
  final String date;
  final String brand;
  final String manufacturingYear;
  final double price;
  final String fuel;
  final String transmission;
  final double mileage;
  final String exColor;
  final String inColor;
  final String vehicleType;
  final String noOfOwners;
  final String wheelSize;
  final String description;
  final String address;
  final String phone;
  final List<dynamic> images;

  const PostModel({
    required this.date,
    required this.brand,
    required this.manufacturingYear,
    required this.price,
    required this.fuel,
    required this.transmission,
    required this.mileage,
    required this.exColor,
    required this.inColor,
    required this.vehicleType,
    required this.noOfOwners,
    required this.wheelSize,
    required this.description,
    required this.address,
    required this.phone,
    required this.images,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      date: json['date'],
      brand: json['brand'],
      manufacturingYear: json['manufacturingYear'],
      price: json['price'],
      fuel: json['fuel'],
      transmission: json['transmission'],
      mileage: json['mileage'],
      exColor: json['exColor'],
      inColor: json['inColor'],
      vehicleType: json['vehicleType'],
      noOfOwners: json['noOfOwners'],
      wheelSize: json['wheelSize'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'brand': brand,
      'manufacturingYear': manufacturingYear,
      'price': price,
      'fuel': fuel,
      'transmission': transmission,
      'mileage': mileage,
      'exColor': exColor,
      'inColor': inColor,
      'vehicleType': vehicleType,
      'noOfOwners': noOfOwners,
      'wheelSize': wheelSize,
      'description': description,
      'address': address,
      'phone': phone,
      'images': images,
    };
  }
}
