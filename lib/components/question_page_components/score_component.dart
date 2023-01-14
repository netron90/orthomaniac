import 'package:flutter/material.dart';

class ScoreIconTracker extends StatelessWidget {
  ScoreIconTracker({required this.scoreColor});

  Color scoreColor;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, color: scoreColor, size: 16.0);
  }
}
