import 'package:orthomaniac/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:orthomaniac/screens/question_screen.dart';

class OrthoManiacApp extends StatelessWidget {
  const OrthoManiacApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo1.png'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                child: Column(
                  children: [
                    Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2, color: kPrimaryColorApp),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 35.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColorApp, width: 1.0),
                      ),
                      child: Text(
                        kAppHomeText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuestionScreen();
                      },
                    ),
                  );
                  print('Begin Statement');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 28.0),
                  child: Text(
                    'COMMENCER',
                    style: TextStyle(
                        fontFamily: 'Heebo', fontWeight: FontWeight.w700),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColorApp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
