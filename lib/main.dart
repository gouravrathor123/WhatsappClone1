import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/CameraScreen.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: LoginScreen (),
    );
  }
}