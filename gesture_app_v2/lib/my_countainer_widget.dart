import 'package:flutter/material.dart';

class MyContainerWidget extends StatefulWidget {
  const MyContainerWidget({super.key});

  @override
  State<MyContainerWidget> createState() => _MyContainerWidgetState();
}

class _MyContainerWidgetState extends State<MyContainerWidget> {
  // todo-double-tap-01: create a variable size for zoom instantly and add fixedSize for specific size
  double _baseSize = 150;
  final List<double> _fixedSize = [150, 200, 300];
  // todo-scale-01: create a variable scale for zoom
  double _baseScaleFactor = 0.5;
  double _scaleFactor = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //double Tab
      onDoubleTap: () {
        setState(() {
          _baseSize = switch (_baseSize) {
            <= 150 => _fixedSize[1],
            <= 200 => _fixedSize[2],
            <= 300 => _fixedSize[0],
            _ => _fixedSize[1],
          };
          _baseScaleFactor = 1.0;
        });
      },
      //zoom
      onScaleStart: (details) {
        _scaleFactor = _baseScaleFactor;
      },
      onScaleUpdate: (details) {
        setState(() {
          _baseScaleFactor = _scaleFactor * details.scale;
        });
      },
      child: Transform.scale(
        scale: _baseScaleFactor,
        child: Image.asset(
          "assets/image/cat.jpeg",
          fit: BoxFit.cover,
          // todo-double-tap-04: change width and height into the baseSize variable
          height: _baseSize,
          width: _baseSize,
        ),
      ),
    );
  }
}
