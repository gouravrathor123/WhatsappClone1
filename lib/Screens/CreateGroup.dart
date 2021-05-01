import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/AvatarCard.dart';
import 'package:flutter_app/CustomUI/ContactCard.dart';
import 'package:flutter_app/Model/ChatsModel.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", status: "Full stack developer"),
    ChatModel(name: "Gourav Rathor", status: "Backend developer"),
    ChatModel(name: "Sejal Jaiswal", status: "Frontend developer"),
    ChatModel(name: "Lokesh Chugani", status: "Lawde ka developer"),
  ];
  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New group",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(
                  fontSize: 13,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 26,
                ),
                onPressed: () {}),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].select == false) {
                      setState(() {
                        contacts[index - 1].select = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].select = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ),
                );
              },
            ),
            groups.length > 0
                ? Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      if (contacts[index].select == true) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              groups.remove(contacts[index]);
                              contacts[index].select = false;
                            });
                          },
                          child: AvatarCard(
                            contact: contacts[index],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            )
                : Container(),
          ],
        ));
  }
}