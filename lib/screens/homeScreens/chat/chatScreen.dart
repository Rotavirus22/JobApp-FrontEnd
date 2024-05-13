import 'package:flutter/material.dart';
import 'package:jobapp/common/constants/messageCard.dart';
import 'package:jobapp/common/ui_helpers.dart';
import 'package:jobapp/models/messageModel.dart';
import 'package:jobapp/provider/features/chatState.dart';
import 'package:jobapp/themes/app_themes.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatState = Provider.of<ChatState>(context);
    return chatState.isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(chatState.image ?? ''),
                  ),
                  sWidthSpan,
                  Text(chatState.name ?? 'N/A'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<MessageModel>>(
                    stream: chatState.messageStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No messages yet.'));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          reverse: true, // Show latest messages at the bottom
                          itemBuilder: (context, index) {
                            return MessageCard(message: snapshot.data![index]);
                          },
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.height * 0.025),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          color: Colors.white60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  chatState.sendMessage();
                                },
                                icon: Icon(
                                  Icons.emoji_emotions,
                                  size: 26,
                                ),
                                color: appPrimColor,
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  onChanged: chatState.onChatChanged,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Type Something...',
                                    hintStyle: TextStyle(color: appPrimColor),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.image,
                                  size: 26,
                                ),
                                color: appPrimColor,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 26,
                                ),
                                color: appPrimColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          chatState.sendMessage();
                        },
                        shape: CircleBorder(),
                        minWidth: 0.01,
                        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                        color: appPrimColor,
                        child: Icon(
                          Icons.send,
                          color: Colors.red,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
