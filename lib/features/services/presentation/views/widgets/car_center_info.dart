import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'car_center_address_details.dart';
import 'show_bottom_sheet.dart';
import 'working_hour_details.dart';
class CarCenterInfo extends StatelessWidget {
   const CarCenterInfo({Key? key, required this.carCenterModel,}) : super(key: key);
      final CarCenterModel carCenterModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarCenterAddress(carCenterModel: carCenterModel,),

          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            color: greyColor,
          ),
          const SizedBox(
            height: 15,
          ),
          WorkingHoursDetails(
            carCenterModel: carCenterModel,
          ),
          const SizedBox(
            height: 10,
          ),

          const Divider(
            height: 1,
            color: greyColor,
          ),
          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width / 3) ,
                  child:  Text(
                    'communicate with the center ',
                    style: Styles.title16.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )
                      ),
                      builder: (context) => ShowBottomSheet(
                        carCenterModel: carCenterModel,
                      ),
                    );
                  },
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side:  const BorderSide(
                          color: mintGreen,
                          style: BorderStyle.solid
                      )
                  ),
                  child:  Text("Contact",style: Styles.title15.copyWith(color: mintGreen)),
                ),

              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),


        ],
      ),
    );
  }
}
