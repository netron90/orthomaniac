class Question{

  String _text1;
  String _orthographe;
  String _text2;
  String _correctAnswer;
  List<String> _multipleAnswers;


  Question(this._text1,this._text2,this._orthographe, this._correctAnswer, this._multipleAnswers);

  String getText1(){
    return this._text1;
  }

  String getText2(){
    return this._text2;
  }

  String getOrthographe(){
    return this._orthographe;
  }

    String getCorrectAnswer(){
    return this._correctAnswer;
  }

  List<String> getMultiAnswer(){
    return this._multipleAnswers;
  }
}