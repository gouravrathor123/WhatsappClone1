import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/CustomCard.dart';
import 'package:flutter_app/Model/ChatsModel.dart';
import 'package:flutter_app/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Gourav",
        isGroup: false,
        currentMessage: "hello there",
        time: "00:12",
        icon: "person.svg"),
    ChatModel(
        name: "Sweeti",
        isGroup: false,
        currentMessage: "sun na",
        time: "10:12",
        icon: "person.svg"),
    ChatModel(
        name: "Akb",
        isGroup: true,
        currentMessage: "hello there",
        time: "09:32",
        icon: "group.svg"),
    ChatModel(
        name: "Pri",
        isGroup: false,
        currentMessage: "kya kar rha h",
        time: "00:12",
        icon: "person.svg"),
    ChatModel(
        name: "Lokesh",
        isGroup: false,
        currentMessage: "bhai kaise patau use",
        time: "00:12",
        icon: "person.svg"),
  ];

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
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}