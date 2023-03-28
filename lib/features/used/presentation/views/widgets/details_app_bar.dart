import 'package:car_club/core/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../post/data/models/post_model.dart';
import '../../model_views/used_cubit/used_cubit.dart';

class DetailsAppBar extends StatefulWidget {
  final PostModel model;
  const DetailsAppBar({Key? key, required this.model}) : super(key: key);

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  var _isLiked = false;
  @override
  void didChangeDependencies() async {
    final favourites = await FirebaseFirestore.instance
        .collection('postsCollection')
        .doc(uId)
        .collection('favourites')
        .get();
    List<PostModel> favs = [];
    for (var doc in favourites.docs) {
      favs.add(PostModel.fromJson(doc.data()));
    }

    // final data = BlocProvider.of<UsedCubit>(context);
    var inFavourites = false;
    for (var fav in favs) {
      if (fav.date == widget.model.date) {
        inFavourites = true;
      }
    }
    if (widget.model.favourites.contains(uId) || inFavourites) {
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

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<UsedCubit>(context, listen: false);
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        'Details',
        style: Styles.title16.copyWith(color: blackColor, fontSize: 16),
      ),
      backgroundColor: whiteColor,
      elevation: 1,
      actions: [
        BlocBuilder<UsedCubit, UsedState>(
          builder: (context, state) {
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
                data.updateFavourites(widget.model, _isLiked, context);
              },
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                color: Colors.red,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
