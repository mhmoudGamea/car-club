import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants.dart';
import '../../../../../used/presentation/views/widgets/car_box_item.dart';
import '../../../../../post/data/models/post_model.dart';
import '../../../../../post/data/post_constants.dart';
import '../../../../../used/presentation/views/details_view.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection(collectionName).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 10,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: const LinearProgressIndicator(
                  color: mintGreen, backgroundColor: greyColor),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          List<PostModel> posts = [];
          snapshot.data!.docs.map(
            (doc) {
              if (uId == doc['uid']) {
                posts.add(PostModel.fromFireStore(doc));
              }
            },
          ).toList();
          return Container(
            margin: const EdgeInsets.only(top: 15),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 10, top: 20),
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 15 / 21,
              ),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(DetailsView.rn, extra: posts[index]);
                  },
                  child: CarBoxItem(model: posts[index])),
            ),
          );
          // return const Text('data');
        });
  }
}
