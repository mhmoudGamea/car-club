import 'package:car_club/core/constants.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../post/data/post_constants.dart';

part 'used_state.dart';

class UsedCubit extends Cubit<UsedState> {
  UsedCubit() : super(UsedInitial());

  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(postsColl);

  // this func. used to get post that the user just added to postsCollection
  Future<void> getPost() async {
    List<PostModel> post = [];
    postsCollectionRF.snapshots().listen((event) async {
      // postsCollection > uId > posts > get all documents
      final QuerySnapshot<Map<String, dynamic>> postsQuery =
          await postsCollectionRF.doc(uId).collection(posts).get();
      final post =
          postsQuery.docs.map((e) => PostModel.fromJson(e.data())).toList();
      print(post.length);
    });
  }
}
