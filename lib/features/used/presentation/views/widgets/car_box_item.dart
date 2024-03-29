import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class CarBoxItem extends StatefulWidget {
  final PostModel model;
  const CarBoxItem({Key? key, required this.model}) : super(key: key);

  @override
  State<CarBoxItem> createState() => _CarBoxItemState();
}

class _CarBoxItemState extends State<CarBoxItem> {
  var _isLiked = false;
  @override
  void didChangeDependencies() {
    if (widget.model.favourites.contains(uId)) {
      setState(() {
        _isLiked = true;
      });
    } else {
      setState(() {
        _isLiked = false;
      });
    }
    super.didChangeDependencies();
  }

  final _format = NumberFormat('###,###,##0');

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<UsedCubit>(context, listen: false);
    String formatedPrice = _format.format(widget.model.price);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          BlocBuilder<UsedCubit, UsedState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.topRight,
                child: LikeButton(
                  mainAxisAlignment: MainAxisAlignment.end,
                  onTap: (isLiked) async {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                    data.updateFavourites(widget.model, _isLiked, context);
                    return _isLiked;
                  },
                  isLiked: _isLiked,
                  size: 22,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      _isLiked
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                      color: Colors.red,
                      size: 20,
                    );
                  },
                  likeCount: widget.model.favourites.length,
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
              );
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Image.network(widget.model.images[0], fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.brand,
                  style: Styles.title15.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '$formatedPrice EGP',
                  style: Styles.title14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
// child: IconButton(
                //   padding: EdgeInsets.zero,
                //   constraints: const BoxConstraints(),
                //   onPressed: () {
                //     setState(() {
                //       _isLiked = !_isLiked;
                //     });
                //     data.updateFavourites(widget.model, _isLiked, context);
                //   },
                //   icon: Icon(
                //     _isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                //     size: 18,
                //     color: Colors.red,
                //   ),
                // ),

*/