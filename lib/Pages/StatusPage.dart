import 'package:flutter/material.dart';
import 'package:flutter_app/CustomUI/StatusPage/HeadOwnStatus.dart';
import 'package:flutter_app/CustomUI/StatusPage/OthersStatus.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            HeadOwnStatus(),
            Label("Recent Updates"),
            OthersStatus(
              name: "Sweeti",
              time: "01:34",
              imageName: "sweeti",
            ),
            OthersStatus(
              name: "Lokesh",
              time: "03:15",
              imageName: "lokesh",
            ),
            OthersStatus(
              name: "Pri",
              time: "11:32",
              imageName: "prii",
            ),
            SizedBox(
              height: 10,
            ),
            Label("Viewed updates"),
            OthersStatus(
              name: "Sweeti",
              time: "01:34",
              imageName: "sweeti",
            ),
            OthersStatus(
              name: "Lokesh",
              time: "03:15",
              imageName: "lokesh",
            ),
            OthersStatus(
              name: "Pri",
              time: "11:32",
              imageName: "prii",
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Label(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelname,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
