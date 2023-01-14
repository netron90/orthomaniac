import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/questionBrain.dart';
import 'package:orthomaniac/constants/constants.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({
   
    required this.questionBrain,
    required this.tracker,
  });

  final QuestionBrain questionBrain;
  final int tracker;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kPrimarySlightColorApp),
      padding:
          EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                fontFamily: 'Heebo',
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
                color: kAccentColorApp),
            children: <TextSpan>[
              TextSpan(
                  text: questionBrain.questionsList[tracker]
                      .getText1()),
              TextSpan(
                text: questionBrain.questionsList[tracker]
                    .getOrthographe(),
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                  text: questionBrain.questionsList[tracker]
                      .getText2())
            ],
          ),
        ),
      ),
    );
  }
}

