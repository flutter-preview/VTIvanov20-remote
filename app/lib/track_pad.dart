import 'dart:ffi';

import 'package:flutter/material.dart';

class TrackPad extends StatefulWidget {
  const TrackPad({Key? key}) : super(key: key);

  @override
  _TrackPadState createState() => _TrackPadState();
}

class _TrackPadState extends State<TrackPad> {
  double _xPosition = 0.0;
  double _yPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: GestureDetector(
          onPanStart: (details) {
            _updatePosition(details.localPosition);
          },
          onPanUpdate: (details) {
            _updatePosition(details.localPosition);
          },
          // debug/dev values
          child: Container(
            height: 500,
            color: const Color(0xFF1C1C1E),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'X Position: $_xPosition',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text(
                    'Y Position: $_yPosition',
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updatePosition(Offset position) {
    setState(() {
      _xPosition = (position.dx - (context.size!.width / 2)).toInt() as double;
      _yPosition = (-position.dy + (context.size!.height / 2)).toInt() as double;
    });
  }
}