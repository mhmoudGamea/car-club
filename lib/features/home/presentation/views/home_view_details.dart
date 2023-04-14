import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/car_model.dart';
import './widgets/home_view_details_body.dart';

class HomeViewDetails extends StatelessWidget {
  static const rn = '/homeViewDetails';
  final CarModel car;
  const HomeViewDetails({
    Key? key,
     required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.normalAppBar(
        context: context,
        title: 'Car Details',
        backgroundColor: const Color(0xffDEE1E7),
        color: Colors.black,
      ),
      body: HomeViewDetailsBody(car: car),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomAppBar(
            height: 80,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${car.brand} ${car.model}',
                      style: Styles.titleLarge.copyWith(
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${car.price} EGP',
                      style: Styles.title14.copyWith(
                          // color: greyColor,
                          ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  child: const Text('Buy Now'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
