
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/ChatsModel.dart';
import 'package:flutter_app/Pages/CameraPage.dart';
import 'package:flutter_app/Pages/ChatPage.dart';
import 'package:flutter_app/Pages/StatusPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.chatmodels,this.sourcechat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: 'WhatsApp Web',
              ),
              PopupMenuItem(
                child: Text("Starred messages"),
                value: 'Starred messages',
              ),
              PopupMenuItem(
                child: Text("New Group"),
                value: 'New Group',
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: 'Settings',
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(chatmodels: widget.chatmodels,sourcechat: widget.sourcechat,),
          StatusPage(),
          Text("CALLS"),
        ],
      ),
    );
  }
}