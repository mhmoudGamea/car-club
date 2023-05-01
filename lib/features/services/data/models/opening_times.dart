
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpeningTimes {
  // TimeOfDay localOpenHour;
  // TimeOfDay localCloseHour;
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
      {
      required this.openHour,
      required this.closeHour,
        // required this.localOpenHour,
        // required this.localCloseHour,
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
        // localOpenHour: json['localOpenHour'],
        // localCloseHour:  json['localCloseHour'],
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
        // 'localOpenHour': localOpenHour,
        // 'localCloseHour': localCloseHour,
          'friday': friday,
          'saturday': saturday,
          'sunday': sunday,
          'monday': monday,
          'tuesday': tuesday,
          'wednesday': wednesday,
          'thursday': thursday,
      };
  }
  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  bool  isOpenMethod({required String open, required String close}) {
    TimeOfDay currentTime = TimeOfDay.now();
    TimeOfDay openTime =  stringToTimeOfDay(open);
    TimeOfDay closeTime =  stringToTimeOfDay(close);
    return currentTime.hour >= openTime.hour
        // && currentTime.minute >= openTime.minute
        && currentTime.hour <= closeTime.hour;
        // && currentTime.minute <= closeTime.minute;
  }

}
