import 'package:flutter/material.dart';
import 'package:ge_camera_app/object_detection_google_ml.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Camera Detection App",
      home: ObjectDetectorView(),
    ),
  );
}
