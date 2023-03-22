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

  // this function executed to make isFavourite field in postModel = true
  final _isFavourite = false;

  bool get getIsFavourite {
    return _isFavourite;
  }

  void updateIsFavourite(PostModel model, bool isLiked) async {
    print(model.uid);
    await postsCollectionRF
        .doc(model.uid)
        .collection(posts)
        .where('date', isEqualTo: model.date)
        .get()
        .then(
      (value) async {
        print(value.docs.length);
        for (var doc in value.docs) {
          if (isLiked) {
            await postsCollectionRF
                .doc(model.uid)
                .collection(posts)
                .doc(doc.id)
                .update({'isFavourite': true});
          } else {
            await postsCollectionRF
                .doc(model.uid)
                .collection(posts)
                .doc(doc.id)
                .update({'isFavourite': false});
          }
        }
      },
      onError: (error) {
        print('in favourite $error');
        emit(IsFavouriteFailure());
      },
    );
  }
}
