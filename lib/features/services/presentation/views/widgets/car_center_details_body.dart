import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/profile/presentation/views/profile_view.dart';
import 'package:car_club/features/reviews/presentation/views/reviews_view.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:car_club/features/services/presentation/views/widgets/car_center_info.dart';
import 'package:car_club/features/services/presentation/views/widgets/show_center_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'abstract_info.dart';

class CarCenterDetailsBody extends StatelessWidget {
  CarCenterDetailsBody({
    Key? key,
    required this.carCenterModel,
    required this.doc
  }) : super(key: key);

  final CarCenterModel carCenterModel;
  final String doc;
  // tabs
  final List<Widget> tabs = [
    Tab(
      child: Text(
        "Info",
        style: TextStyle(color: blackColor.withOpacity(0.6)),
      ),
    ),
    Tab(
      child: Text(
        "Reviews",
        style: TextStyle(color: blackColor.withOpacity(0.6)),
      ),
    ),
  ];
  // tab bar views
  late final List<Widget> tabsBarViews = [

    CarCenterInfo(carCenterModel: carCenterModel),
    ReviewsView(carCenterModel: carCenterModel,doc: doc),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        top: true,
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //context.read<CarCenterCubit>(),
                ShowCenterImages(carCenterModel: carCenterModel),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if(carCenterModel.user.profileImage!.isNotEmpty)
                            InkWell(
                              child: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(carCenterModel.user.profileImage!),
                              radius: 25,
                          ),
                              onTap: () {
                                GoRouter.of(context).push(
                                  ProfileView.rn
                                );
                              },
                            ),
                          if(carCenterModel.user.profileImage!.isEmpty)
                            InkWell(
                              child: const CircleAvatar(
                                backgroundColor: greyColor,
                              radius: 25,
                          ),
                              onTap: () {
                                GoRouter.of(context).push(
                                    ProfileView.rn
                                );

                              },
                            ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                carCenterModel.name,
                                style: Styles.title16,
                              ),
                              Text(
                                carCenterModel.user.name,
                                style: Styles.title12
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.locationDot,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                carCenterModel.address,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.title15.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                softWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      AbstractInformation(carCenterModel: carCenterModel),

                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 1,
                        color: greyColor,
                      ),

                      // const CarCenterInfo(),

                      TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        indicatorColor: mintGreen,
                        tabs: tabs,
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                          height: 500,
                          child: TabBarView(children: tabsBarViews)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

