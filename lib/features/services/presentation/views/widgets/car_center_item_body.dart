import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants.dart';

class ItemViewBody extends StatelessWidget {
  ItemViewBody(
      {Key? key,
      required this.carCenterModel,
      required this.carCenterDoc,
      required this.rating})
      : super(key: key);
  final PageController pageController = PageController();
  // final List<String> images = [
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4aXrkkEuxA30xGfyl1FNyCiRcw-CGKblhQ&usqp=CAU",
  //   'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
  //   'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'
  // ];
  final double rating;
  static const rn = '/ItemViewBody';
  final CarCenterModel carCenterModel;
  final String carCenterDoc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      color: whiteColor,
      child: Card(
        color: whiteColor,
        shadowColor: Colors.black,
        elevation: 20,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemBuilder: (context, index) => CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: carCenterModel.images[index],
                    ),
                    itemCount: carCenterModel.images.length,
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (value) {},
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: carCenterModel.images.length,
                      effect: const ExpandingDotsEffect(
                        dotColor: greyColor,
                        activeDotColor: whiteColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 2,
                        spacing: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                          carCenterModel
                                  .images[carCenterModel.images.length - 1] ??
                              'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                        ),
                        backgroundColor: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    carCenterModel.name,
                                    // softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    FlutterRating(
                                      rating: rating,
                                      starCount: 5,
                                      borderColor: Colors.grey,
                                      color: Colors.amberAccent,
                                      allowHalfRating: true,
                                      size: 20,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text("(${carCenterModel.reviewCount})")
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    carCenterModel.description,
                                    // softWrap: false,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: greyColor,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                if (carCenterModel.credit)
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.lightGreenAccent
                                        .withOpacity(0.3),
                                    child: const Icon(
                                      FontAwesomeIcons.creditCard,
                                      color: Colors.green,
                                      size: 15,
                                    ),
                                  ),
                                if (carCenterModel.delivery)
                                  const SizedBox(
                                    width: 5,
                                  ),
                                if (carCenterModel.delivery)
                                  CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.lightGreenAccent
                                        .withOpacity(0.3),
                                    child: const Icon(
                                      Icons.delivery_dining,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${carCenterModel.time} min",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      if (carCenterModel.openingTimes.isOpenMethod(
                              open: carCenterModel.openingTimes.openHour,
                              close: carCenterModel.openingTimes.closeHour) ==
                          true)
                         Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.lock_open_outlined,
                                size: 16,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "open",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      if (carCenterModel.openingTimes.isOpenMethod(
                              open: carCenterModel.openingTimes.openHour,
                              close: carCenterModel.openingTimes.closeHour) ==
                          false)
                         Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.lock,
                                size: 16,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "closed",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
