import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIndicator extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerIndicator(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.black,
      ),
    );
  }
}
