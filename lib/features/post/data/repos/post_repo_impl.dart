import 'package:car_club/features/post/data/repos/post_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../post_constants.dart';

class PostRepoImpl implements PostRepo {
// postsCollection > uid > posts > dynamically generated document for each post
  CollectionReference postsCollection =
      FirebaseFirestore.instance.collection(postsColl);
  @override
  Future<void> addNewPost(String uId, Map<String, dynamic> post) async {
    await postsCollection.doc(uId).collection(posts).add(post);
  }
}
