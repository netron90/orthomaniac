import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/questionBrain.dart';
import 'package:orthomaniac/constants/constants.dart';

class QuestionGoalComponent extends StatelessWidget {
  const QuestionGoalComponent({
    Key? key,
    required this.questionBrain,
    required this.tracker,
  }) : super(key: key);

  final QuestionBrain questionBrain;
  final int tracker;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2, color: kPrimaryColorApp),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: kPrimarySlightColorApp,
            border: Border.all(color: kPrimaryColorApp, width: 1.0),
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  color: kAccentColorApp),
              children: <TextSpan>[
                TextSpan(text: 'Corrige l\'orthographe du mot '),
                TextSpan(
                  text: questionBrain.questionsList[tracker]
                      .getOrthographe(),
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: ' au besoin.')
              ],
            ),
          ),
        )
      ],
    );
  }
}
