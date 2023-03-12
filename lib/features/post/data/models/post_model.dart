class PostModel {
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
  final String description;
  final String address;

  const PostModel({
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
    required this.description,
    required this.address,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
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
      description: json['description'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'description': description,
      'address': address,
    };
  }
}
