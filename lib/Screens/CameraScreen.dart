import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/CameraView.dart';
import 'package:flutter_app/Screens/VideoView.dart';

List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;
  Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool iscamerafront=true;
  double transform=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(_cameraController),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile ram =
                              await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => VideoViewPage(
                                path: ram.path,
                              ),
                            ),
                          );
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        onPressed: () async{
                          setState(() {
                            iscamerafront=!iscamerafront;
                            transform=transform+pi;
                          });
                          int camerapos = iscamerafront?0:1;
                          _cameraController = CameraController(
                              cameras[camerapos], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        },
                      ),
                    ],
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile path = await _cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraViewPage(
          path: path.path,
        ),
      ),
    );
  }
}
