import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/ButtonCard.dart';
import 'package:flutter_app/Model/ChatsModel.dart';
import 'package:flutter_app/Screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Gourav",
      isGroup: false,
      currentMessage: "hello there",
      time: "00:12",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Sweeti",
      isGroup: false,
      currentMessage: "sun na",
      time: "10:12",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "Pri",
      isGroup: false,
      currentMessage: "kya kar rha h",
      time: "00:12",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Lokesh",
      isGroup: false,
      currentMessage: "bhai kaise patau use",
      time: "00:12",
      icon: "person.svg",
      id: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            sourceChat = chatmodels.removeAt(index);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(chatmodels:chatmodels),
              ),
            );
          },
          child: ButtonCard(
            name: chatmodels[index].name,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
