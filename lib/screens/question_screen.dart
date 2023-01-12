import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/score_tracker.dart';
import 'package:orthomaniac/constants/constants.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
                Container(
                  decoration: BoxDecoration(
                    color: kSlightAccentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kAccentColorApp,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/logo_small.png'),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              'Score',
                              style: TextStyle(
                                  fontFamily: 'Heebo',
                                  fontWeight: FontWeight.w200,
                                  color: kWhiteColor,
                                  fontSize: 18.0),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                              ),
                              child: VerticalDivider(
                                color: Colors.white,
                                width: 1.0,
                                thickness: 1,
                                indent: 20.0,
                                endIndent: 0.0,
                              ),
                            )
                          ],
                        ),
                        ScoreTracker(
                          starColor: kIncorrectAnswerStarColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  decoration: BoxDecoration(color: kPrimarySlightColorApp),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
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
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy '),
                          TextSpan(
                            text: 'astraunote',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                              text:
                                  ' tempor invidunt ut labore et dolore magna aliquyam erat, sed diam')
                        ]),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Column(
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
                              text: 'astraunote',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: ' au besoin.')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print('astronaute');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 28.0),
                        child: Text(
                          'astronaute',
                          style: TextStyle(
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColorApp,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('astronaute');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 28.0),
                        child: Text(
                          'astroneaute',
                          style: TextStyle(
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColorApp,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('astronaute');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 28.0),
                        child: Text(
                          'astronote',
                          style: TextStyle(
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColorApp,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('astronaute');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 28.0),
                        child: Text(
                          'astronnote',
                          style: TextStyle(
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColorApp,
                      ),
                    ),
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


// 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy astraunote tempor invidunt ut labore et dolore magna aliquyam erat, sed diam'