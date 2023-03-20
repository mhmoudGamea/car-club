import 'package:car_club/core/constants.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../post/data/post_constants.dart';

part 'used_state.dart';

class UsedCubit extends Cubit<UsedState> {
  UsedCubit() : super(UsedInitial());

  // this func. used to get post that the user just added to postsCollection

  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(postsColl);

  List<PostModel> postsModel = [];
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
    });
  }
}
