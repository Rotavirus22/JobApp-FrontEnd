import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobapp/models/dashBoardModel.dart';
import 'package:jobapp/models/messageModel.dart';
import 'package:jobapp/services/dio_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatState extends ChangeNotifier {
  ChatState(context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    userId = args['userId'];
    name = args['userName'];
    image = args['userImage'];
    getUserInfo();
    messageStream;
    fetchMessage();
  }
  String? message;
  String? senderId;
  String? senderName;
  String? senderEmail;
  DateTime? createdOn;
  bool? seen;
  String? userId;
  String? name;
  String? image;

  DashboardModel? dashboardModel;
  bool isLoading = false;

  Dio dio = dioService();

  List<MessageModel> messages = [];

  onChatChanged(value) {
    message = value;
    notifyListeners();
  }

  getUserInfo() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await dio.get('/users/dashboard');
      dashboardModel = DashboardModel.fromJson(response.data);
      senderId = dashboardModel!.data!.sId;
      senderName = dashboardModel!.data!.fullName;
      senderEmail = dashboardModel!.data!.email;
    } on DioException catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage() async {
    MessageModel newMessage = MessageModel(
      receiverId: userId,
      receiver: name,
      content: message,
      createdOn: DateTime.now(),
      seen: false,
      image: image,
      sender: senderName,
      senderId: senderId,
    );
    await FirebaseFirestore.instance
        .collection('messages')
        .add(newMessage.toMap());
    messages.add(newMessage);
    message = '';
    notifyListeners();
  }

  Stream<List<MessageModel>> get messageStream {
    return FirebaseFirestore.instance
        .collection('messages')
        .where('receiverId', isEqualTo: userId)
        .where('senderId', isEqualTo: senderId)
        .orderBy('createdOn', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      // Combine received messages
      final receivedMessages = snapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();

      // Fetch sent messages where current user is the sender
      final sentMessagesQuery = await FirebaseFirestore.instance
          .collection('messages')
          .where('senderId', isEqualTo: userId)
          .where('receiverId', isEqualTo: senderId)
          .orderBy('createdOn', descending: true)
          .get();

      // Map sent messages
      final sentMessages = sentMessagesQuery.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();

      // Combine received and sent messages
      final allMessages = receivedMessages + sentMessages;

      // Sort messages by createdOn timestamp
      allMessages.sort((a, b) => b.createdOn!.compareTo(a.createdOn!));

      return allMessages;
    });
  }

  Future<void> fetchMessage() async {
    isLoading = true;
    notifyListeners();
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('receiverId', isEqualTo: userId)
          .where('senderId', isEqualTo: senderId)
          .orderBy('createdOn', descending: true)
          .get();
      messages = querySnapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
