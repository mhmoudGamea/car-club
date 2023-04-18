import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/core/utils/assets.dart';
import 'package:flutter/material.dart';
class ShowImage extends StatelessWidget {
  const ShowImage({Key? key, required this.image}) : super(key: key);
  final String image;
  static const rn = '/ShowImage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: CachedNetworkImage(
          imageUrl: image,
          errorWidget: (context, url, error) => const Image(image: AssetImage(whiteImage)),
          placeholder: (context, url) => const Center(child : CircularProgressIndicator()),
          width: double.infinity,
          fit: BoxFit.fill,
      ),
    );
  }
}
