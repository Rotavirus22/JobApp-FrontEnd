import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart'; // Import rxdart package
import 'package:jobapp/main.dart';
import 'package:jobapp/models/messageModel.dart';
import 'package:jobapp/provider/chat/lastMessage.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastState = Provider.of<LastMessageState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: StreamBuilder<List<MessageModel>>(
        stream: _messageStream(lastState.dashboardModel?.data?.sId),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          List<MessageModel>? messages = snapshot.data;

          if (messages == null || messages.isEmpty) {
            return Center(
              child: Text('No messages found'),
            );
          }

          // Create a map to store the latest message for each user
          Map<String, MessageModel> latestMessages = {};

          // Loop through all messages and update the latest message for each user
          for (var message in messages) {
            String userId = '';
            // Determine the user ID based on whether the current user is the sender or receiver
            if (lastState.dashboardModel?.data?.sId == message.senderId) {
              userId = message.receiverId ?? '';
            } else {
              userId = message.senderId ?? '';
            }

            // Update latest message if current message is newer or if no message exists for this user
            if (!latestMessages.containsKey(userId) ||
                message.createdOn!
                    .isAfter(latestMessages[userId]!.createdOn!)) {
              latestMessages[userId] = message;
            }
          }

          return ListView.builder(
            itemCount: latestMessages.length,
            itemBuilder: (context, index) {
              final message = latestMessages.values.toList()[index];

              bool isSender =
                  lastState.dashboardModel?.data?.sId == message.senderId;

              String nameToShow =
                  isSender ? message.receiver ?? '' : message.sender ?? '';

              // Format the timestamp
              String timestampText = _formatTimestamp(message.createdOn!);

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(message.image ?? ''),
                ),
                title: Text(nameToShow),
                subtitle: Text(message.content ?? ''),
                trailing: Text(timestampText),
                onTap: () {
                  navigagorKey.currentState!
                      .pushNamed('/chatScreen', arguments: {
                    'userId': isSender ? message.receiverId : message.senderId,
                    'userName': nameToShow,
                    'userImage': message.image,
                  });
                },
              );
            },
          );
        },
      ),
    );
  }

  Stream<List<MessageModel>> _messageStream(String? currentUserId) {
    if (currentUserId == null) {
      return Stream.empty();
    }

    final senderMessagesStream = FirebaseFirestore.instance
        .collection('messages')
        .where('senderId', isEqualTo: currentUserId)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        Timestamp timestamp = doc['createdOn'];
        DateTime createdOn = timestamp.toDate();
        return MessageModel(
          content: doc['content'],
          createdOn: createdOn,
          image: doc['image'],
          receiver: doc['receiver'],
          receiverId: doc['receiverId'],
          seen: doc['seen'],
          sender: doc['sender'],
          senderId: doc['senderId'],
          type: doc['type'],
        );
      }).toList();
    });

    final receiverMessagesStream = FirebaseFirestore.instance
        .collection('messages')
        .where('receiverId', isEqualTo: currentUserId)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        Timestamp timestamp = doc['createdOn'];
        DateTime createdOn = timestamp.toDate();
        return MessageModel(
          content: doc['content'],
          createdOn: createdOn,
          image: doc['image'],
          receiver: doc['receiver'],
          receiverId: doc['receiverId'],
          seen: doc['seen'],
          sender: doc['sender'],
          senderId: doc['senderId'],
          type: doc['type'],
        );
      }).toList();
    });

    return Rx.combineLatest2(senderMessagesStream, receiverMessagesStream,
        (List<MessageModel> senderMessages,
            List<MessageModel> receiverMessages) {
      // Combine sender and receiver messages
      List<MessageModel> allMessages = [];
      allMessages.addAll(senderMessages);
      allMessages.addAll(receiverMessages);
      return allMessages;
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (timestamp.year == now.year &&
        timestamp.month == now.month &&
        timestamp.day == now.day) {
      return 'Today at ${timestamp.hour}:${timestamp.minute}';
    } else if (timestamp.year == yesterday.year &&
        timestamp.month == yesterday.month &&
        timestamp.day == yesterday.day) {
      return 'Yesterday at ${timestamp.hour}:${timestamp.minute}';
    } else {
      return '${_getMonthName(timestamp.month)} ${timestamp.day}';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
