import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0.1, horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: secondaryDark, width: 1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              search,
              width: 50,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: secondaryDark, width: 1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: secondaryDark,
          ),
          child: TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              //fillColor: Color(0xff64636A),
              hintText: 'Find your suitable car',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              hintStyle: Styles.titleSmall.copyWith(
                fontWeight: FontWeight.w300,
                color: const Color(0xff64636A),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
