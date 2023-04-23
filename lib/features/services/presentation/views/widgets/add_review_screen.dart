import 'package:flutter/material.dart';
import 'dart:io';

import 'package:car_club/core/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/styles.dart';


class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);
  static const rn = '/AddReviewScreen';
  static double rate = 0;
  static final TextEditingController  controller =  TextEditingController();
  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size:  22,
            color: Colors.black,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text("Share Reviews",style: Styles.titleLarge,),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Share  "),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Share your experience at   Car Center Name",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900
                ),
                softWrap: true,
              ),

            ),
            const SizedBox(height: 10),
            Text(
              "help thousands of users benefits from your experience",
              style: Styles.title13.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Text(
              "Rate Car Center Name",
              style: Styles.title16.copyWith(color: Colors.black,fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                // RatingBarIndicator(
                //   rating: 5,
                //   itemCount: 5,
                //   itemSize: 20,
                //   unratedColor: greyColor,
                //   itemPadding: const EdgeInsets.all(5.0),
                //   itemBuilder: (context, index) {
                //     return  const Icon(
                //       FontAwesomeIcons.star,
                //       color: greyColor2,
                //       fill: 1,
                //     );
                //   },
                // ),
                RatingBar.builder(
                  itemCount: 5,
                  itemSize: 28,
                  unratedColor: greyColor,
                  itemPadding: const EdgeInsets.all(2.0),
                  itemBuilder: (context, index) {
                    return  const Icon(
                      Icons.star,
                      color: Colors.amber,
                      fill: 1,
                    );
                  },
                  onRatingUpdate: (value) {
                    print("Rate : $value");
                    AddReviewScreen.rate = value;
                    setState(() {});
                  },
                ),
                const Spacer(),
                Row(
                  children: [
                    Text("${AddReviewScreen.rate.toInt()}",style: Styles.title16.copyWith(fontSize: 40,fontWeight: FontWeight.w400,),),
                    const Text("/5"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              color: greyColor,
              height: 2,
            ),
            const SizedBox(height: 20),
            Text("Your review",style: Styles.title13.copyWith(fontWeight: FontWeight.w500,color:blackColor.withOpacity(0.6)),),
            TextFormField(
              onFieldSubmitted: (value) {

              },
              controller: AddReviewScreen.controller,
              keyboardType: TextInputType.text,
              decoration:  const InputDecoration(
                  hintText: "Write your review here. The best reviews are very descriptive and comprehensive",
                  hintMaxLines: 2,
                  hintStyle:TextStyle(
                      color: greyColor,
                      fontSize: 15,
                      height: 0.9
                  ),
                  border: InputBorder.none
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: greyColor,
              height: 2,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text("Add Photos (Optional)",style: Styles.title13.copyWith(fontWeight: FontWeight.w500,color:blackColor.withOpacity(0.6))),
                const Spacer(),
                TextButton(
                  onPressed: () async{
                    File? reviewImage;
                    var picker = ImagePicker();
                    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                    if(pickedImage == null ){
                      Helper.showCustomToast(
                          context: context,
                          bgColor: Colors.red,
                          icon: FontAwesomeIcons.circleXmark,
                          msg: "no image selected please,try again"
                      );
                    }else{
                      reviewImage = File(pickedImage.path);
                      print('image path :: ${reviewImage.path}');
                    }

                  },
                  child: Text("+ Add",style: Styles.title13.copyWith(fontWeight: FontWeight.w500,color:blackColor.withOpacity(0.6)),),
                ),
              ],
            ),
            Text("Add photos to your review to be more descriptive",style: Styles.title13.copyWith(fontWeight: FontWeight.w500,color:blackColor)),
          ],
        ),
      ),
    );
  }
}
