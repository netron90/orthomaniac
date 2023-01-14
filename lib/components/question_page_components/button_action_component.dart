import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/questionBrain.dart';
import 'package:orthomaniac/constants/constants.dart';

class ButtonAction extends StatelessWidget {

  ButtonAction(
      {required this.onPressed,
      required this.tracker,
      required this.randomAnswers,
      required this.buttonSelected,
      required this.questionBrain});

  final VoidCallback onPressed;
  int tracker;
  int buttonSelected;
  List<int> randomAnswers;
  QuestionBrain questionBrain;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
        child: Text(
          questionBrain.questionsList[tracker]
              .getMultiAnswer()[randomAnswers.elementAt(buttonSelected)],
          style: TextStyle(
              fontFamily: 'Heebo', fontWeight: FontWeight.w700, fontSize: 16.0),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColorApp,
      ),
    );
  }
}
