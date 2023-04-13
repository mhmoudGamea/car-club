import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String date;
  final String message;
  final String senderUid;
  final String receiverUid;
  final dynamic receiverProfileImage;

  const ChatModel(
      {required this.date,
      required this.message,
      required this.senderUid,
      required this.receiverUid,
      required this.receiverProfileImage});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
        date: json['date'],
        message: json['message'],
        senderUid: json['senderUid'],
        receiverUid: json['receiverUid'],
        receiverProfileImage: json['receiverProfileImage']);
  }
  factory ChatModel.fromFireStore(QueryDocumentSnapshot<Object?> json) {
    return ChatModel(
        date: json['date'],
        message: json['message'],
        senderUid: json['senderUid'],
        receiverUid: json['receiverUid'],
        receiverProfileImage: json['receiverProfileImage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'message': message,
      'senderUid': senderUid,
      'receiverUid': receiverUid,
      'receiverProfileImage': receiverProfileImage,
    };
  }
}
