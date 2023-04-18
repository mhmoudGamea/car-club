import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/features/services/presentation/views/widgets/phone_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../chats/presentation/views/chat_view.dart';
class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        right: 15.0,
        left: 15.0,
        bottom: 15.0,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      height: (MediaQuery.of(context).size.height)/3.1,
      child: Column(
        children: [
          Container(
            height: 8,
            width: 70,
            decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(height: 40,),

          Row(
            children:   [
              const CircleAvatar(
                radius: 20,
                backgroundColor: mintGreen,
                child: Icon(FontAwesomeIcons.car,color: whiteColor,size: 18.7,),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: (MediaQuery.of(context).size.width / 3)*2 ,
                child: const Text(
                  'You can chat with the engineer through the application ',
                  style: Styles.title16,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),

            ],
          ),
          const SizedBox(height: 30,),
          Container(
            height: 36,
            width: ((MediaQuery.of(context).size.width)/4)*3.6,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                color: mintGreen
            ),
            child: ElevatedButton(
              child: const Text("Chat Now",style: Styles.title16),
              onPressed: () {
                GoRouter.of(context).push(ChatView.rn,extra: UserModel(uId: "K8PzMMzuNsTYuRtT1FY8Tk6sbkx2", name: "Adel Ashraf", email: "mazenglal19@gmail.com", phone: "01129547302"));
              },
            ),
          ),

          const SizedBox(height: 20,),
          const Divider(
            color: greyColor,
            height: 1,
          ),
          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (MediaQuery.of(context).size.width / 3) ,
                  child:  Text(
                    'Inquires from the center ',
                    style: Styles.title16.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                    ),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          )
                      ),
                      builder: (context) => const ShowPhoneSheet(),
                    );
                  },
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side:  const BorderSide(
                          color: mintGreen,
                          style: BorderStyle.solid
                      )
                  ),
                  child:  Text("Call the Center",style: Styles.title16.copyWith(color: mintGreen)),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}