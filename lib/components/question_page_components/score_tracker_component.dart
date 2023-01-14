import 'package:flutter/material.dart';
import 'package:orthomaniac/components/question_page_components/score_brain.dart';
import 'package:orthomaniac/components/question_page_components/score_component.dart';
import 'package:orthomaniac/constants/constants.dart';

class ScoreTrackerComponent extends StatelessWidget {
  const ScoreTrackerComponent({
   
    required this.scoreData,
  });

  final ScoreBrain scoreData;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
              children: [
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[0].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[1].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[2].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[3].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[4].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[5].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[6].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[7].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[8].getScoreColor(),
                ),
                ScoreIconTracker(
                  scoreColor: scoreData.getList()[9].getScoreColor(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}