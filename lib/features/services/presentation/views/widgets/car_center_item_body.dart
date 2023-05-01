import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class ItemViewBody extends StatelessWidget {
  const ItemViewBody({Key? key, required this.carCenterModel})
      : super(key: key);
  static const rn = '/ItemViewBody';
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(30),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 3,
          child: Container(
            color: greyColor,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  height: 250,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: carCenterModel.images[0],
                      errorWidget: (context, url, error) =>
                          const Image(image: AssetImage(whiteImage)),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carCenterModel.name,
                        style: Styles.titleSmall.copyWith(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.black45,
                        // thickness: 1,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.clock,
                                color: Colors.black,
                                size: 19,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${carCenterModel.time} minutes',
                                style: Styles.titleSmall
                                    .copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                          if(carCenterModel.openingTimes.isOpenMethod(open: carCenterModel.openingTimes.openHour, close: carCenterModel.openingTimes.closeHour)==true)
                            Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.unlock,
                                color: Colors.black,
                                size: 19,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'opened',
                                style: Styles.titleSmall
                                    .copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                          if(carCenterModel.openingTimes.isOpenMethod(open: carCenterModel.openingTimes.openHour, close: carCenterModel.openingTimes.closeHour)==false)
                            Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                                size: 19,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'closed',
                                style: Styles.titleSmall
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.paperPlane,
                                color: Colors.black,
                                size: 19,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${carCenterModel.distance.ceil()} km',
                                style: Styles.titleSmall
                                    .copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
