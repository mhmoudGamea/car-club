import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/core/widgets/shimmer_indecator.dart';
import 'package:flutter/material.dart';

import '../../../../post/data/models/post_model.dart';
import 'car_details_horizontal_box.dart';

class DetailsViewBody extends StatefulWidget {
  final PostModel model;
  const DetailsViewBody({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Helper.normalAppBar(
          backgroundColor: whiteColor,
          context: context,
          color: blackColor,
          elevation: 1,
          title: 'Details',
          iconSize: 20,
        ),
        const SizedBox(height: 2),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 230,
              child: CachedNetworkImage(
                imageUrl: widget.model.images[_index],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const ShimmerIndicator(width: double.infinity, height: 150),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                color: greyColor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.model.images.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _index = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            left:
                                const BorderSide(color: mintGreen, width: 1.2),
                            top: const BorderSide(color: mintGreen, width: 1.2),
                            bottom:
                                const BorderSide(color: mintGreen, width: 1.2),
                            right: (index == widget.model.images.length - 1)
                                ? const BorderSide(color: mintGreen, width: 1.2)
                                : BorderSide.none,
                          ),
                        ),
                        child: CachedNetworkImage(
                            imageUrl: widget.model.images[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CraDetailsHorizontalBox(model: widget.model),
            ],
          ),
        ),
      ],
    );
  }
}
