import 'package:flutter/material.dart';
import 'package:gesture_app/get_gesture_detector.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: GetGestureDetector());
  }
}
