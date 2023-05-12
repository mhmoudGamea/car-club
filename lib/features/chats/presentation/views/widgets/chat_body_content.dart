import 'package:car_club/core/constants.dart';
import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/core/utils/styles.dart';
import 'package:car_club/core/widgets/shimmer_indecator.dart';
import 'package:car_club/features/chats/data/models/chat_model.dart';
import 'package:car_club/features/chats/presentation/model_views/cubit/chat_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatBodyContent extends StatelessWidget {
  final UserModel userModel;
  const ChatBodyContent({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .collection('chats')
            .doc(userModel.uId)
            .collection('messages')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: 10,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: const LinearProgressIndicator(
                  color: mintGreen, backgroundColor: greyColor),
            );
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
          }
          List<ChatModel> chatModel = [];
          for (var doc in snapshot.data!.docs) {
            chatModel.add(ChatModel.fromFireStore(doc));
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            itemCount: chatModel.length,
            itemBuilder: (context, index) => buildMessageWidget(
              context,
              uId == chatModel[index].senderUid,
              chatModel[index].message,
              userModel.profileImage,
              chatModel[index].date,
            ),
          );
        });
  }
}

Widget buildMessageWidget(
    BuildContext context, bool isMe, String text, dynamic image, String date) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(right: isMe ? 10 : 0, left: isMe ? 0 : 10),
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe)
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(image),
              ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.only(top: 5, bottom: 1),
              constraints: const BoxConstraints(maxWidth: 250, maxHeight: 200),
              decoration: BoxDecoration(
                color: isMe ? mintGreen : greyColor.withOpacity(.6),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                  bottomLeft: isMe
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                ),
              ),
              child: text.contains('https')
                  ? BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        if (state is StoredImageLoading ||
                            state is ChatLoading) {
                          return const ShimmerIndicator(
                              width: 250, height: 200);
                        } else {
                          return Image.network(text);
                        }
                      },
                    )
                  : Text(text,
                      style: Styles.title14
                          .copyWith(color: blackColor, letterSpacing: 0.8)),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: isMe ? 10 : 0, left: isMe ? 0 : 45),
        child: Align(
            alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
            child: Text(
              DateFormat.jm().format(DateTime.parse(date)),
              style: Styles.title12.copyWith(color: blackColor),
            )),
      ),
      const SizedBox(height: 5),
    ],
  );
}
