import 'package:flutter/material.dart';

class GetGestureDetector extends StatefulWidget {
  const GetGestureDetector({super.key});

  @override
  State<GetGestureDetector> createState() => _GetGestureDetectorState();
}

class _GetGestureDetectorState extends State<GetGestureDetector> {
  bool _lockOpen = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: FractionalOffset.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                _lockOpen ? Icons.lock_open_outlined : Icons.lock_outlined,
                color: Colors.black,
                size: 60,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _lockOpen = !_lockOpen;
                });
              },
              child: Container(
                color: Colors.orange.shade600,
                padding: const EdgeInsets.all(8),
                child: Text(_lockOpen ? 'CLOSE THE LOCK' : 'OPEN THE LOCK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
