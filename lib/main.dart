import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


AppBrain appBrain = AppBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Test"),
          backgroundColor: Colors.grey,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExampPage(),
        ),
      ),
    );
  }
}

class ExampPage extends StatefulWidget {
  @override
  _ExampPageState createState() => _ExampPageState();
}

class _ExampPageState extends State<ExampPage> {

   List <Widget> answerResult = [];

   int rightAnswsers = 0;

  void checkAnswer(bool whatUserPicked){

    bool correctAnswer = appBrain.getQuestionanswer();
                
    setState(() {
      if(whatUserPicked == correctAnswer){

      rightAnswsers++;
      answerResult.add(Icon(Icons.thumb_up , color: Colors.green));
      answerResult.add(SizedBox(width: 10));
    
      }else{
        
        answerResult.add(Icon(Icons.thumb_down , color: Colors.red));
        answerResult.add(SizedBox(width: 10));
        
      }

      if(appBrain.isFinished() == true){
        
        Alert(
          context: context,
          title: "Finshed Exam",
          desc: "You Anwser a correct $rightAnswsers Form 7",
          buttons: [
            DialogButton(child: Text("Start Now", style: TextStyle(color: Colors.white, fontSize: 20),),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        appBrain.rest();
        rightAnswsers = 0;
        
      }else{

      appBrain.newxtQuestion();  

      }


     });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Row(children: answerResult),   

        Expanded(
            flex: 5,
            child: Column(children: [
            Image.asset(appBrain.getQuestionImage()),
            SizedBox(height: 20,),
            Text(appBrain.getQuestionText() , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.grey), textAlign: TextAlign.center,)
          ],),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
                child: Text("True", style: TextStyle(fontSize: 20, color: Colors.white , fontWeight: FontWeight.bold),),
                color: Colors.indigo,
                onPressed: (){
                  checkAnswer(true);
                },
           ),
          ),
        ),

       Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
                child: Text("False", style: TextStyle(fontSize: 20, color: Colors.white , fontWeight: FontWeight.bold),),
                color: Colors.deepOrange,
                onPressed: (){
                  checkAnswer(false);
                },
           ),
          ),
        )
    ],);
  }
}
