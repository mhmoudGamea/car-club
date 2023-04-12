import 'package:car_club/core/constants.dart';
import 'package:car_club/features/used/presentation/views/details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../home/presentation/views/widgets/car_box_item.dart';
import '../../../../post/data/models/post_model.dart';
import '../../../../post/data/post_constants.dart';

class UsedViewBody extends StatelessWidget {
  const UsedViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 10,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(left: 120, right: 120),
            child: const LinearProgressIndicator(
                color: mintGreen, backgroundColor: greyColor),
          );
        }
        List<PostModel> posts = [];
        snapshot.data!.docs.map(
          (doc) {
            posts.add(PostModel.fromFireStore(doc));
          },
        ).toList();
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          itemCount: posts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 15 / 21,
          ),
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(DetailsView.rn, extra: posts[index]);
              },
              child: CarBoxItem(model: posts[index])),
        );
      },
    );
  }
}
