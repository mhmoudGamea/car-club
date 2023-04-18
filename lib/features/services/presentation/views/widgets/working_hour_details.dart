import 'package:car_club/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class WorkingHoursDetails extends StatelessWidget {
  const WorkingHoursDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              const Icon(FontAwesomeIcons.clock,size: 25,),
              const SizedBox(width: 15,),
              const Text(
                'Working Hours',
                style: Styles.titleLarge,
              ),
              const Spacer(),

              // Row(
              //   children: const [
              //     Icon(FontAwesomeIcons.circleExclamation,size: 18,color: Colors.red,),
              //     SizedBox(width: 5,),
              //     Text(
              //       'Closed now',
              //       style: Styles.title14,
              //     ),
              //   ],
              // ),
              Row(
                children:  const [
                  Icon(FontAwesomeIcons.solidCircleCheck,size: 18,color: Colors.green),
                  SizedBox(width: 5,),
                  Text(
                    'opened now',
                    style: Styles.title14,
                  ),
                ],
              ),

            ],
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 37.0,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Friday              12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Saturday         12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sunday            12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Monday           12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Tuesday          12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Wednesday    12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Thursday        12:00 pm - 10 pm",
                  style: Styles.title16.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.3
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
