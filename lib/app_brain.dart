import 'package:exmantioapp/question.dart';

class AppBrain{
   int _questionNumber = 0;

   List<Questions> _questionGroup =[

     Questions(q: "The Number of Salary System is Eight" , i: "images/image-1.jpg" , a: true),
     Questions(q: "Is Cat from Cute Enamle" , i: "images/image-2.jpg" , a: true),
     Questions(q: "Chine is in Afraic " , i: "images/image-3.jpg" , a: false),
     Questions(q: "The Eathe is Stright not Circle" , i: "images/image-4.jpg" , a: false),
     Questions(q: "Humen can be alive without eat meet" , i: "images/image-5.jpg" , a: true),
     Questions(q: "The sun is moving around the earth" , i: "images/image-6.jpg" , a: false),
     Questions(q: "The enaml can not feel with pain" , i: "images/image-7.jpg" , a: false),
  
  ];

  void newxtQuestion(){
    if(_questionNumber < _questionGroup.length -1){
       _questionNumber++;
    }else{
       
    }
  }

  String getQuestionText(){
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage(){
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionanswer(){
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber >= _questionGroup.length- 1){
      return true;
    }else{
      return false;
    }
  }

  void rest(){
    _questionNumber = 0;
  }
  
}