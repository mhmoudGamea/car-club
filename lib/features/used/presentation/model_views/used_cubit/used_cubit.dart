import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../post/data/post_constants.dart';

part 'used_state.dart';

class UsedCubit extends Cubit<UsedState> {
  UsedCubit() : super(UsedInitial());

  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(postsColl);

  List<PostModel> postsModel = [];

  // this function is executed periodically when new user add new post
  // but if the same user post his second post he must pull to refresh
  // to execute this function again and see his post
  Future<void> getPosts() async {
    emit(UsedCarPostsLoading());

    postsCollectionRF.snapshots().listen((event) async {
      // postsCollection > uId > posts > get all documents
      for (var doc in event.docs) {
        final QuerySnapshot<Map<String, dynamic>> postsQuery =
            await postsCollectionRF.doc(doc.id).collection(posts).get();

        for (var e in postsQuery.docs) {
          postsModel.add(PostModel.fromJson(e.data()));
        }
      }
      emit(UsedCarPostsSuccess(posts: postsModel));
      postsModel = [];
    }, onError: (error) {
      emit(UsedCarPostsFailure(error: error));
    });
  }

  // this func executed to add model to favourite collection

  Future<void> addToFavourites(PostModel model) async {
    await postsCollectionRF
        .doc(uId)
        .collection('favourites')
        .add(model.toJson())
        .then((value) {
      value.update({
        'favourites': FieldValue.arrayUnion([uId])
      });
    });
  }

  // this func executed to remove model to favourite collection

  Future<void> removeFromFavourites(PostModel model) async {
    await postsCollectionRF
        .doc(uId)
        .collection('favourites')
        .where('date', isEqualTo: model.date)
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        await postsCollectionRF
            .doc(uId)
            .collection('favourites')
            .doc(doc.id)
            .delete();
      }
    });
  }

  // this func executed to make isFavourite field in postModel = true or false

  void updateFavourites(PostModel model, bool isLiked, context) async {
    await postsCollectionRF
        .doc(model.uid)
        .collection(posts)
        .where('date', isEqualTo: model.date)
        .get()
        .then(
      (value) async {
        for (var doc in value.docs) {
          if (isLiked) {
            await postsCollectionRF
                .doc(model.uid)
                .collection(posts)
                .doc(doc.id)
                .update({
              'favourites': FieldValue.arrayUnion([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Added to your favourites');
              await addToFavourites(model);
            });
          } else {
            await postsCollectionRF
                .doc(model.uid)
                .collection(posts)
                .doc(doc.id)
                .update({
              'favourites': FieldValue.arrayRemove([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Removed from your favourites');
              await removeFromFavourites(model);
            });
          }
        }
      },
      onError: (error) {
        emit(IsFavouriteFailure());
      },
    );
  }
}
