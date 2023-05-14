
import 'package:car_club/features/services/data/models/car_center_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/constants.dart';
class ItemViewBody extends StatefulWidget {
  const ItemViewBody({Key? key, required this.carCenterModel})
      : super(key: key);
  static const rn = '/ItemViewBody';
  final CarCenterModel carCenterModel;

  @override
  State<ItemViewBody> createState() => _ItemViewBodyState();
}

class _ItemViewBodyState extends State<ItemViewBody> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4aXrkkEuxA30xGfyl1FNyCiRcw-CGKblhQ&usqp=CAU"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 160,
            decoration:  BoxDecoration(
              color:  whiteColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              border: Border.all(width: 2, color: Colors.grey.shade100),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 12.0, left: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: CircleAvatar(
                          radius: 33.0,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi4aXrkkEuxA30xGfyl1FNyCiRcw-CGKblhQ&usqp=CAU"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Row(
                              children:  [
                                const Text(
                                  "Choco Jail",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(width: 50,),
                                RatingBar.builder(
                                  itemSize: 15,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) => setState(() {
                                    this.rating = rating;
                                  }),
                                ),
                                Text('($rating)')
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Tarts and chocolates, Desserts",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const Divider(
                    height: 5,
                    thickness: 1,
                    color: greyColo3,
                    indent: 0,

                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Icon(Icons.schedule,color: mintGreen),
                      SizedBox(width: 7,),
                      Text("40 mins",style: TextStyle(color: blackColor),),
                      SizedBox(width: 75,),

                      Icon(Icons.delivery_dining,color:mintGreen),
                      SizedBox(width: 7,),
                      Text("20.0 EGP",style: TextStyle(color: blackColor)),

                    ],
                  )
                ],
              ),

            ),

          )
        ],
      ),
    );
  }
}
