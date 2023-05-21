import 'package:car_club/core/constants.dart';
import 'package:car_club/core/utils/helper.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../post/data/post_constants.dart';

part 'used_state.dart';

class UsedCubit extends Cubit<UsedState> {
  UsedCubit() : super(UsedInitial());

  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(collectionName);

  // this func executed to update favourites field in firestore by add or remove user uid

  void updateFavourites(
      PostModel model, bool isLiked, BuildContext context) async {
    // print(isLiked);
    await postsCollectionRF.where('date', isEqualTo: model.date).get().then(
      (value) async {
        // here i got only one document if there is no 2 posts added at the same second
        for (var doc in value.docs) {
          if (isLiked) {
            await postsCollectionRF.doc(doc.id).update({
              'favourites': FieldValue.arrayUnion([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Added to your favourites');
              //await addToFavourites(model);
            });
          } else {
            await postsCollectionRF.doc(doc.id).update({
              'favourites': FieldValue.arrayRemove([uId])
            }).then((value) async {
              Helper.showCustomToast(
                  context: context,
                  bgColor: babyBlue,
                  icon: FontAwesomeIcons.circleCheck,
                  msg: 'Removed from your favourites');
              //await removeFromFavourites(model);
            });
          }
        }
      },
      onError: (error) {
        emit(IsFavouriteFailure());
      },
    );
  }

  // details page
}
