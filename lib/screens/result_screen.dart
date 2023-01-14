import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:orthomaniac/components/question_page_components/question.dart';
import 'package:orthomaniac/components/question_page_components/questionBrain.dart';
import 'package:orthomaniac/components/question_page_components/score_brain.dart';
import 'package:orthomaniac/components/question_page_components/score_tracker_component.dart';
import 'package:orthomaniac/constants/constants.dart';
import 'package:orthomaniac/services/ad_helper.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {required this.globalAnswer,
      required this.questionBrain,
      required this.questionCheck,
      required this.goodquestionCheck,
      required this.badquestionCheck,
      required this.goodAnswers,
      required this.badAnswers,
      required this.scoreData});

  List<bool> globalAnswer;
  QuestionBrain questionBrain;
  List<Question> questionCheck;
  List<Question> goodquestionCheck;
  List<Question> badquestionCheck;
  List<String> goodAnswers;
  List<String> badAnswers;
  ScoreBrain scoreData;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  InterstitialAd? _interstitialAd;

  List<bool> globalA = [];
  List<Question> questionCheck = [];
  List<String> badAnswers = [];
  List<bool> correctA = [];
  List<bool> incorrectA = [];

  void correctAnswer() {
    for (int i = 0; i < widget.globalAnswer.length; i++) {
      if (widget.globalAnswer[i] == true) {
        correctA.add(true);
      } else {
        incorrectA.add(false);
      }
    }
  }

    void _loadInterstitialAd(BuildContext context) {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pop(context);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          Navigator.pop(context);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
   
    globalA = widget.globalAnswer;
    questionCheck = widget.questionCheck;
    QuestionBrain q = widget.questionBrain;
    badAnswers = widget.badAnswers;
    correctAnswer();
    return WillPopScope(
      onWillPop: () {
       _loadInterstitialAd(context);
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhiteColor,
          body: CustomScrollView(
            slivers: [
             
               SliverToBoxAdapter(
                  
                  child: Material(
                    elevation: 4.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                      child: ScoreTrackerComponent(
                        scoreData: widget.scoreData,
                      ),
                    ),
                  ),
                ),
             
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonnes réponses',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Heebo',
                            color: kAccentColorApp,
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate:
                    SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(color: kPrimarySlightColorApp),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 40.0),
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
                                      text:
                                          widget.goodquestionCheck[index].getText1()),
                                  TextSpan(
                                    text: widget.goodquestionCheck[index]
                                        .getOrthographe(),
                                    style: TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.goodquestionCheck[index].getText2())
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: kPrimaryColorApp,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Heebo',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                        color: kWhiteColor),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Réponse: '),
                                      TextSpan(
                                        text: widget.goodquestionCheck[index].getCorrectAnswer(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.0,
                        )
                      ],
                    ),
                  );
                }, childCount: correctA.length),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mauvaises réponses',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Heebo',
                            color: kAccentColorApp,
                            fontWeight: FontWeight.w300,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 2.0,
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              SliverList(
                delegate:
                    SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(color: kIncorrectAnswerSlightColor),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 40.0),
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
                                      text:
                                          widget.badquestionCheck[index].getText1()),
                                  TextSpan(
                                    text: widget.badquestionCheck[index]
                                        .getOrthographe(),
                                    style: TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                      text:
                                          widget.badquestionCheck[index].getText2())
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: kIncorrectAnswerColor,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Heebo',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                        color: kWhiteColor),
                                    children: <TextSpan>[
                                      TextSpan(text: ' Votre réponse: '),
                                      TextSpan(
                                        text: widget.badAnswers[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(text: '. La bonne réponse est: '),
                                      TextSpan(
                                        text: widget.goodAnswers[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18.0,
                        )
                      ],
                    ),
                  );
                }, childCount: incorrectA.length),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed:(){
                              _loadInterstitialAd(context);
                             
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
                              child: Text(
                              'OK',
                                style: TextStyle(
                        fontFamily: 'Heebo', fontWeight: FontWeight.w700, fontSize: 16.0),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColorApp,
                            ),
                          ),
                      ),
                    ],
                  ),
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

