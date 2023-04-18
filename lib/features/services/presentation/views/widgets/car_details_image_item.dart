import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/features/services/presentation/views/widgets/showImage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
class ItemImage extends StatelessWidget {
  const ItemImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(ShowImage.rn,extra: image);
      },
      child: CachedNetworkImage(
        imageUrl: image,
        errorWidget: (context, url, error) =>  const Image(image: AssetImage(whiteImage)),
        placeholder: (context, url) => const Center(child : CircularProgressIndicator()),
        width: double.infinity,
        height: 10,
        fit: BoxFit.cover,
      ),
    );
  }
}
