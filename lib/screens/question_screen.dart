import 'dart:math';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/button_action_component.dart';
import 'package:orthomaniac/components/question_page_components/question.dart';
import 'package:orthomaniac/components/question_page_components/questionBrain.dart';
import 'package:orthomaniac/components/question_page_components/question_container.dart';
import 'package:orthomaniac/components/question_page_components/question_goal_component.dart';
import 'package:orthomaniac/components/question_page_components/score.dart';
import 'package:orthomaniac/components/question_page_components/score_brain.dart';
import 'package:orthomaniac/components/question_page_components/score_component.dart';
import 'package:orthomaniac/components/question_page_components/score_tracker_component.dart';
import 'package:orthomaniac/constants/constants.dart';
import 'package:orthomaniac/screens/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  ScoreBrain scoreData = ScoreBrain();
  QuestionBrain questionBrain = QuestionBrain();
  int tracker = 0;
  List<bool> globalAnswer = [];
  List<Question> questionCheck = [];
  List<String> badAnswerCheck = [];
  List<String> goodAnswerCheck = [];
  List<Question> goodQuestionCheck = [];
  List<Question> badQuestionCheck = [];

  int allQuestion = 0;
  List<int> randomAnswer = [];
  List<int> randomQuestion = [];

  void checkAnswer(QuestionBrain questionBrain, int buttonSelected) {
    if (questionBrain.questionsList[tracker].getMultiAnswer()[randomAnswer.elementAt(buttonSelected)] ==
        questionBrain.questionsList[tracker].getCorrectAnswer()) {
          print('La reponse est vrai: \n COrrect Answer: ${questionBrain.questionsList[tracker].getCorrectAnswer()}');
      setState(
        () {
          Audio.load('assets/songs/correct_answer.mp3')..play()..dispose();
          scoreData.updateScoreIconColor(tracker);
          globalAnswer.add(true);
          questionCheck.add(questionBrain.questionsList[tracker]);
          goodQuestionCheck.add(questionBrain.questionsList[tracker]);
          if (tracker >= 10 - 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                 builder: (context) => ResultScreen(globalAnswer: globalAnswer, questionBrain: questionBrain, questionCheck: questionCheck, goodquestionCheck: goodQuestionCheck, badquestionCheck: badQuestionCheck, goodAnswers: goodAnswerCheck,badAnswers: badAnswerCheck, scoreData: scoreData,),
              ),
            );
          } 
          else {
            tracker++;
          }
        },
      );
    } 
    else {
      Audio.load('assets/songs/wrong_answer.mp3')..play()..dispose();
      globalAnswer.add(false);
      questionCheck.add(questionBrain.questionsList[tracker]);
      badQuestionCheck.add(questionBrain.questionsList[tracker]);
      goodAnswerCheck.add(questionBrain.questionsList[tracker].getCorrectAnswer());
      badAnswerCheck.add(questionBrain.questionsList[tracker].getMultiAnswer()[randomAnswer.elementAt(buttonSelected)]);
      if (tracker >= 10 - 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(globalAnswer: globalAnswer, questionBrain: questionBrain, questionCheck: questionCheck, goodquestionCheck: goodQuestionCheck, badquestionCheck: badQuestionCheck, goodAnswers: goodAnswerCheck,badAnswers: badAnswerCheck, scoreData: scoreData,),
          ),
        );
      } else {
        setState(() {
          tracker++;
        });
      }
    }
  }


  void setRandomAnswer() {
    for (int i = 0; i < 4; i++) {
      randomAnswer.add(i);
    }
  }

  @override
  void initState() {
    questionBrain.questionsList.shuffle();
   
    setRandomAnswer();
    randomAnswer.shuffle();
    randomAnswer.shuffle();
    print('Random Answer: $randomAnswer');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kWhiteColor,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreTrackerComponent(scoreData: scoreData),
                SizedBox(
                  height: 12.0,
                ),
                Expanded(
                  child: 
                  QuestionContainer(questionBrain: questionBrain, tracker: tracker),
                ),
                SizedBox(
                  height: 12.0,
                ),
                QuestionGoalComponent(questionBrain: questionBrain, tracker: tracker),
                SizedBox(
                  height: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonAction(onPressed: ()=> checkAnswer(questionBrain, 0), tracker: tracker, randomAnswers: randomAnswer, buttonSelected: 0, questionBrain: questionBrain,),
                    SizedBox(
                      height: 10.0,
                    ),
                   ButtonAction(onPressed: ()=> checkAnswer(questionBrain, 1), tracker: tracker, randomAnswers: randomAnswer, buttonSelected: 1, questionBrain: questionBrain,),
                    SizedBox(
                      height: 10.0,
                    ),
                    ButtonAction(onPressed: ()=> checkAnswer(questionBrain, 2), tracker: tracker, randomAnswers: randomAnswer, buttonSelected: 2, questionBrain: questionBrain,),
                    SizedBox(
                      height: 10.0,
                    ),
                    ButtonAction(onPressed: ()=> checkAnswer(questionBrain, 3), tracker: tracker, randomAnswers: randomAnswer, buttonSelected: 3, questionBrain: questionBrain,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// class ButtonAction extends StatelessWidget {
 

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//                       onPressed: () {
//                         print('astronaute');
//                         checkAnswer(questionBrain, 0);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 14.0, horizontal: 28.0),
//                         child: Text(
//                           questionBrain.questionsList[tracker]
//                               .getMultiAnswer()[randomAnswer.elementAt(0)],
//                           style: TextStyle(
//                               fontFamily: 'Heebo',
//                               fontWeight: FontWeight.w700,
//                               fontSize: 16.0),
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary: kPrimaryColorApp,
//                       ),
//                     );
//   }
// }