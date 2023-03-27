import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/widgets/favourite_box.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarBoxPreviewDetails extends StatelessWidget {
  final List images;
  const CarBoxPreviewDetails({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          CarouselSlider(
            items: images
                .map(
                  (image) => SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        height: 200,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 20,
            child: FavouriteBox(
                backGroundColor: Color(0xffB7DFFF),
                // backGroundColor: babyBlue,
                color: Colors.black54,
                icon: Icons.favorite_rounded),
          ),
        ],
      ),
    );
  }
}
