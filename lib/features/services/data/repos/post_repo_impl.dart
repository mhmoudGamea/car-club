import 'package:cloud_firestore/cloud_firestore.dart';
import '../center_constants.dart';
import 'post_repo.dart';

class PostRepoImpl implements PostRepo {
  CollectionReference centersCollection = FirebaseFirestore.instance.collection(centersColl);
  @override
  Future<void> addNewCarCenter(String uId, Map<String, dynamic> carCenter) async {
    await centersCollection.add(carCenter);
  }


}
