import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';


class ItemViewBody extends StatelessWidget {
  const ItemViewBody({Key? key, required this.carCenterModel }) : super(key: key);
  static const rn = '/ItemViewBody';
  final CarCenterModel carCenterModel;
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: const [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(image: AssetImage(ford),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Car name',
                      style: Styles.titleSmall.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
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
                          FontAwesomeIcons.bolt,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' hp',
                          style:
                          Styles.titleSmall.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.gaugeHigh,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '15 km/h',
                          style:
                          Styles.titleSmall.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.dollarSign,
                          color: Colors.black54,
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '50',
                          style:
                          Styles.titleSmall.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
=======
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
                  padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                  height: 250,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: CachedNetworkImage(
                      imageUrl: carCenterModel.images[0],
                      errorWidget: (context, url, error) =>  const Image(image: AssetImage(whiteImage)),
                      placeholder: (context, url) => const Center(child : CircularProgressIndicator()),
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
                                style:
                                Styles.titleSmall.copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.unlock,
                                color: Colors.black,
                                size: 19,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'open',
                                style:
                                Styles.titleSmall.copyWith(color: Colors.green),
                              ),
                              // Text(
                              //   'closed',
                              //   style:
                              //   Styles.titleSmall.copyWith(color: Colors.red),
                              // ),
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
                                style:
                                Styles.titleSmall.copyWith(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
>>>>>>> 4fc29250da27454e50c6ff9216c4c83f57288dd8
                ),
              ],
            ),
          ),
<<<<<<< HEAD
        ],
=======
        ),
>>>>>>> 4fc29250da27454e50c6ff9216c4c83f57288dd8
      ),
    );
  }
}
