import 'package:car_club/features/post/data/repos/post_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../post_constants.dart';

class PostRepoImpl implements PostRepo {
// postsCollection > uid > posts > dynamically generated document for each post
  CollectionReference postsCollectionRF =
      FirebaseFirestore.instance.collection(collectionName);
  @override
  Future<void> addNewPost(String uId, Map<String, dynamic> post) async {
    await postsCollectionRF.add(post);
    // this is to make uId documents descoverable as flutterFirestore said
    // await postsCollectionRF.doc(uId).set({'dummy': '1'});
  }
}
