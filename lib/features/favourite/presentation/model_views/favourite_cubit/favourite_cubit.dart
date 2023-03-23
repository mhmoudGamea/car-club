import 'dart:async';

import 'package:car_club/core/constants.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../post/data/post_constants.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(postsColl);

  // final List<PostModel> _favList = [];

  // List<PostModel> get getFavList {
  //   return _favList;
  // }

  // Future<void> getFavourites() async {
  //   postsCollectionRF
  //       .doc(uId)
  //       .collection('favourites')
  //       .snapshots()
  //       .listen((event) {
  //     for (var doc in event.docs) {
  //       _favList.add(PostModel.fromJson(doc.data()));
  //     }
  //     emit(AddedToFavourite(favs: _favList));
  //     _favList.clear();
  //   });
  // }
}
