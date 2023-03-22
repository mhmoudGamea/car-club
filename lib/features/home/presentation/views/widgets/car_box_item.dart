import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:car_club/features/used/presentation/model_views/used_cubit/used_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBoxItem extends StatefulWidget {
  final PostModel model;
  const CarBoxItem({Key? key, required this.model}) : super(key: key);

  @override
  State<CarBoxItem> createState() => _CarBoxItemState();
}

class _CarBoxItemState extends State<CarBoxItem> {
  var _isLiked = false;
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<UsedCubit>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
                data.updateIsFavourite(widget.model, _isLiked);
              },
              icon: BlocBuilder<UsedCubit, UsedState>(
                builder: (context, state) {
                  return Icon(
                    _isLiked
                        ? Icons.favorite
                        : (widget.model.isFavourite
                            ? (data.getFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded)
                            : Icons.favorite_outline_rounded),
                    size: 18,
                    color: Colors.red,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Image.network(widget.model.images[0], fit: BoxFit.cover),
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
                  widget.model.brand,
                  style: Styles.title15.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  '${widget.model.price}',
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
