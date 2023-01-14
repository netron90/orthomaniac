import 'package:flutter/material.dart';
import 'package:orthomaniac/constants/constants.dart';

class Score{

  Color _scoreColor;

  Score(this._scoreColor);

  void setScoreColor(Color color){
    this._scoreColor = color;
  }

  Color getScoreColor(){
    return this._scoreColor;
  }
}