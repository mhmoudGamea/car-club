import 'package:car_club/core/constants.dart';
import 'package:car_club/features/post/data/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/car_box_item.dart';
import '../../../../post/data/post_constants.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(postsColl)
          .doc(uId)
          .collection('favourites')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: babyBlue));
        }
        List<PostModel> favs = [];
        snapshot.data!.docs
            .map(
              (json) => favs.add(
                PostModel(
                  date: json['date'],
                  brand: json['brand'],
                  manufacturingYear: json['manufacturingYear'],
                  price: json['price'],
                  fuel: json['fuel'],
                  transmission: json['transmission'],
                  mileage: json['mileage'],
                  exColor: json['exColor'],
                  inColor: json['inColor'],
                  vehicleType: json['vehicleType'],
                  noOfOwners: json['noOfOwners'],
                  wheelSize: json['wheelSize'],
                  description: json['description'],
                  address: json['address'],
                  phone: json['phone'],
                  images: json['images'],
                  favourites: List.from(json['favourites']),
                  uid: json['uid'],
                ),
              ),
            )
            .toList();
        // print(favs.length);
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          itemCount: favs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 15 / 21,
          ),
          itemBuilder: (context, index) => CarBoxItem(model: favs[index]),
        );
      },
    );
  }
}
