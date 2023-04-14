class OpeningTimes {
  String openHour;
  String closeHour;
  bool friday;
  bool saturday;
  bool sunday;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  OpeningTimes(
      {required this.openHour,
      required this.closeHour,
      required this.friday,
      required this.monday,
      required this.saturday,
      required this.sunday,
      required this.thursday,
      required this.tuesday,
      required this.wednesday});

  factory OpeningTimes.fromJson(Map<String, dynamic> json) {
      return OpeningTimes(
          openHour: json['openHour'],
          closeHour:  json['closeHour'],
          friday: json['friday'],
          saturday:  json['saturday'],
          sunday:  json['sunday'],
          monday:  json['monday'],
          tuesday: json['tuesday'],
          wednesday: json['wednesday'],
          thursday:  json['thursday'],
      );
  }

  Map<String, dynamic> toMap() {
      return {
          'openHour': openHour,
          'closeHour': closeHour,
          'friday': friday,
          'saturday': saturday,
          'sunday': sunday,
          'monday': monday,
          'tuesday': tuesday,
          'wednesday': wednesday,
          'thursday': thursday,
      };
  }

}
