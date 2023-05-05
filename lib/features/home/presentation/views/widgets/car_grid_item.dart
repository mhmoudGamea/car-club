import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/home/presentation/model_views/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

import '../../../data/models/car_model.dart';

class CarGridItem extends StatefulWidget {
  final CarModel car;
  const CarGridItem({Key? key, required this.car}) : super(key: key);

  @override
  State<CarGridItem> createState() => _CarGridItemState();
}

class _CarGridItemState extends State<CarGridItem> {
  var _isLiked = false;
  @override
  void didChangeDependencies() {
    if (widget.car.favorites.contains(uId)) {
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
    final data = BlocProvider.of<HomeCubit>(context, listen: false);
    String formatedPrice = _format.format(widget.car.price);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.topRight,
                child: LikeButton(
                  mainAxisAlignment: MainAxisAlignment.end,
                  onTap: (isLiked) async {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                    data.updateFavourites(widget.car, _isLiked, context);
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
                  likeCount: widget.car.favorites.length,
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
          // const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: CachedNetworkImage(
              imageUrl: widget.car.images[0],
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.car.brand} ${widget.car.model}',
                  style: Styles.title15.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '$formatedPrice EGP',
                  style: Styles.title13.copyWith(color: Colors.grey[700]),
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
Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.topRight,
                child: LikeButton(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // onTap: (isLiked) async {
                  //   setState(() {
                  //     _isLiked = !_isLiked;
                  //   });
                  //   data.updateFavourites(widget.car, _isLiked, context);
                  //   return _isLiked;
                  // },
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
                  likeCount: widget.car.favorites.length,
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
            child: CachedNetworkImage(
              imageUrl: widget.car.images[0],
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.car.brand} ${widget.car.model}',
                  style: Styles.title15.copyWith(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  '$formatedPrice EGP',
                  style: Styles.title13.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
*/