import 'package:flutter/material.dart';

class ScoreTracker extends StatelessWidget {
  ScoreTracker({required this.starColor});

  Color starColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
        Icon(
          Icons.star,
          color: starColor,
          size: 16.0,
        ),
      ],
    );
  }
}
