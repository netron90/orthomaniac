import 'package:orthomaniac/components/question_page_components/score.dart';
import 'package:orthomaniac/constants/constants.dart';

class ScoreBrain{

List<Score> scoreList = [
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor),
  Score(kIncorrectAnswerStarColor)];

  List<Score> getList(){
    return scoreList;
  }

  void updateScoreIconColor(int number){
    scoreList[number].setScoreColor(kWhiteColor);
  }

  void updateScoreIconColorWithBool(List<bool> tab){
    for(int i = 0; i < tab.length; i++){
      if(tab[i] == true){
        scoreList[i].setScoreColor(kWhiteColor);
      }else{}
    }
  }
}