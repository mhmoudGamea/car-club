import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:car_club/features/services/presentation/views/widgets/show_center_images.dart';
import 'package:car_club/features/services/presentation/views/widgets/working_hour_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'car_center_address_details.dart';
import 'show_bottom_sheet.dart';
class CarCenterDetailsBody extends StatelessWidget {
  CarCenterDetailsBody({Key? key, required this.carCenterModel, }) : super(key: key);
  final CarCenterModel carCenterModel;
  // final UserModel userModel;
  final List<String> images = [
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ShowCenterImages(images: images),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(images[0]),
                          radius: 25,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Car Club',
                              style: Styles.titleLarge,
                            ),
                            Text(
                              'Mazen Glal',
                              style: Styles.title12
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationDot,
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 3) * 2.6,
                          child: Text(
                            'United States, California, San Mateo County, Menlo Park',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.title16
                                .copyWith(fontWeight: FontWeight.w400),
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // 40 minutes
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.clock,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '40 minutes',
                                  style: Styles.title14
                                      .copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Delivery is available
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.motorcycle,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  ' Delivery is available',
                                  style: Styles.title14
                                      .copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // Accepts discounts
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.percent,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Accepts discounts',
                                  style: Styles.title14
                                      .copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Open
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.unlock,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Open',
                                  style: Styles.title13.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        //Closed
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.lock,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Closed',
                                  style: Styles.title13.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // Accepts discounts
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: greyColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.creditCard,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Accepts credit cards',
                                  style: Styles.title14
                                      .copyWith(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 1,
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const CarCenterAddress(),

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

                    const WorkingHoursDetails(),
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
                                builder: (context) => const ShowBottomSheet(),
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
                            child:  Text("Contact",style: Styles.title16.copyWith(color: mintGreen)),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
