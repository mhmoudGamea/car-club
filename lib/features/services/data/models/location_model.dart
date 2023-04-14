class LocationModel {
  final double latitude;
  final double longitude;
  final String address;
  final double distance;
  final int time;
  LocationModel(

      {
        required this.time,
        required this.distance,
        required this.latitude, required this.longitude, required this.address});
}