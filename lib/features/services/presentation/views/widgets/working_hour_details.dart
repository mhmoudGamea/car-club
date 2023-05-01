import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkingHoursDetails extends StatelessWidget {
  const WorkingHoursDetails({Key? key, required this.carCenterModel}) : super(key: key);
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.clock,
                size: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Working Hours',
                style: Styles.title16,
              ),
              const Spacer(),
              if(carCenterModel.openingTimes.isOpenMethod(open: carCenterModel.openingTimes.openHour, close: carCenterModel.openingTimes.closeHour)==false)
                Row(
                children: const [
                  Icon(FontAwesomeIcons.circleExclamation,size: 18,color: Colors.red,),
                  SizedBox(width: 5,),
                  Text(
                    'Closed now',
                    style: Styles.title14,
                  ),
                ],
              ),
              if(carCenterModel.openingTimes.isOpenMethod(open: carCenterModel.openingTimes.openHour, close: carCenterModel.openingTimes.closeHour)==true)
                Row(
                children: const [
                  Icon(FontAwesomeIcons.solidCircleCheck,
                      size: 18, color: Colors.green),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'opened now',
                    style: Styles.title14,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37.0, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(carCenterModel.openingTimes.friday == true)
                Text(
                  "Friday                 ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.saturday == true)
                Text(
                  "Saturday              ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                if(carCenterModel.openingTimes.saturday == true)
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.sunday == true)
                Text(
                  "Sunday               ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),                ),
                if(carCenterModel.openingTimes.sunday == true)
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.monday == true)
                Text(
                  "Monday              ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),                ),
                if(carCenterModel.openingTimes.monday == true)
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.tuesday == true)
                Text(
                  "Tuesday             ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),                ),
                if(carCenterModel.openingTimes.tuesday == true)
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.wednesday == true)
                Text(
                  "Wednesday           ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                if(carCenterModel.openingTimes.wednesday == true)
                const SizedBox(
                  height: 10,
                ),
                if(carCenterModel.openingTimes.thursday == true)
                Text(
                  "Thursday            ${carCenterModel.openingTimes.openHour} - ${carCenterModel.openingTimes.closeHour}",
                  style: Styles.title15.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black),                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
