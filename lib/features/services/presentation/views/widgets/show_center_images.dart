import 'package:car_club/features/services/presentation/views/widgets/show_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants.dart';
import 'car_center_map.dart';
import 'car_details_image_item.dart';
class ShowCenterImages extends StatelessWidget {
  ShowCenterImages({
    super.key,
    required this.images,
  });

  final List<String> images;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      borderOnForeground: false,
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 250,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView.builder(
              reverse: true,
              itemBuilder: (context, index) =>
                  ItemImage(image: images[index]),
              itemCount: 2,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: mintGreen,
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        FontAwesomeIcons.phone,
                        color: mintGreen,
                      ),
                    ),
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
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      backgroundColor: whiteColor,
                      child: Icon(
                        FontAwesomeIcons.locationDot,
                        color: mintGreen,
                      ),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(CarCenterMap.rn);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: const ExpandingDotsEffect(
                    dotColor: whiteColor,
                    activeDotColor: mintGreen,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 3,
                    spacing: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}