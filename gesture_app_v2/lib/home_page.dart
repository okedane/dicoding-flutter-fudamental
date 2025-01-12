import 'package:flutter/material.dart';
import 'package:gesture_app_v2/my_bookmark_icon_widget.dart';
import 'package:gesture_app_v2/my_countainer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyContainerWidget(),
              MyBookmarkIconWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
