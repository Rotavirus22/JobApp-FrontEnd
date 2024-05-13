import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobapp/models/messageModel.dart';
import 'package:jobapp/provider/features/chatState.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:jobapp/main.dart';

class MessageCard extends StatefulWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);

  final MessageModel message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    final chatState = Provider.of<ChatState>(context);
    bool isMe = widget.message.senderId == chatState.senderId;

    return isMe ? _greenMessage(widget.message) : _blueMessage(widget.message);
  }

  Widget _blueMessage(MessageModel message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(mq.width * .04),
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
              color: appPrimColor,
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Text(
              message.content!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(mq.width * .04),
          child: Text(
            message.createdOn != null
                ? DateFormat('HH:mm').format(message.createdOn!)
                : '',
          ),
        ),
      ],
    );
  }

  Widget _greenMessage(MessageModel message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(mq.width * .04),
          child: Text(
            message.createdOn != null
                ? DateFormat('HH:mm').format(message.createdOn!)
                : '',
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(mq.width * .04),
            margin: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .01),
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Text(
              message.content!,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
