import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/CustomCard.dart';
import 'package:flutter_app/Model/ChatsModel.dart';
import 'package:flutter_app/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key, this.chatmodels, this.sourcechat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourcechat: widget.sourcechat,
        ),
      ),
    );
  }
}
