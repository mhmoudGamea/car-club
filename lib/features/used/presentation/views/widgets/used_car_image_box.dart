import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/shimmer_indecator.dart';

class UsedCarImageBox extends StatefulWidget {
  final List<dynamic> images;
  const UsedCarImageBox({Key? key, required this.images}) : super(key: key);

  @override
  State<UsedCarImageBox> createState() => _UsedCarImageBoxState();
}

class _UsedCarImageBoxState extends State<UsedCarImageBox> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 230,
          child: CachedNetworkImage(
            imageUrl: widget.images[_index],
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
                itemCount: widget.images.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (_index != index) {
                      setState(() {
                        _index = index;
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        left: const BorderSide(color: mintGreen, width: 1.2),
                        top: const BorderSide(color: mintGreen, width: 1.2),
                        bottom: const BorderSide(color: mintGreen, width: 1.2),
                        right: (index == widget.images.length - 1)
                            ? const BorderSide(color: mintGreen, width: 1.2)
                            : BorderSide.none,
                      ),
                    ),
                    child: CachedNetworkImage(imageUrl: widget.images[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
