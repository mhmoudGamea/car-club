import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class CHelpfulWidget extends StatefulWidget {
  const CHelpfulWidget({Key? key}) : super(key: key);

  @override
  _CHelpfulWidgetState createState() => _CHelpfulWidgetState();
}

class _CHelpfulWidgetState extends State<CHelpfulWidget> {
  var _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LikeButton(
          bubblesColor: const BubblesColor(
            dotPrimaryColor: mintGreen,
            dotSecondaryColor: babyBlue,
            dotThirdColor: greyColor,
          ),
          onTap: (isLiked) async {
            setState(() {
              _isLiked = !_isLiked;
            });
            //data.updateFavourites(widget.model, _isLiked, context);
            return _isLiked;
          },
          isLiked: _isLiked,
          size: 22,
          likeBuilder: (bool isLiked) {
            return Icon(
              _isLiked
                  ? FontAwesomeIcons.solidThumbsUp
                  : FontAwesomeIcons.thumbsUp,
              color: mintGreen,
              size: 18,
            );
          },
          // likeCount: widget.model.favourites.length,
          likeCount: 10,
          likeCountPadding: EdgeInsets.zero,
          countPostion: CountPostion.left,
          countBuilder: (int? count, bool isLiked, String text) {
            var color = isLiked ? blackColor : greyColor;
            Widget result;
            if (count == 0) {
              result = Text(
                "0",
                style: TextStyle(color: color),
              );
            } else {
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            }
            return result;
          },
        ),
        const SizedBox(width: 5),
        Text(
          'Helpful',
          style: Styles.title13.copyWith(
            color: blackColor,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
