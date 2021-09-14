import 'package:flutter/material.dart';
import 'QuizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizBank = QuizBank();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.amberAccent,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //create 2 lists, empty one to keepscore, a list of right and wrong icons to add to keepscore
  List<Widget> score = [
    Icon(Icons.check, color: Colors.green),
    Icon(Icons.close, color: Colors.red),
    Icon(Icons.thumb_up, color: Colors.white24),
    Icon(Icons.thumb_down, color: Colors.white24)
  ];
  List<Widget> scoreKeeper = [];
  List<Widget> useranswer = [];

  void checkAnswer(bool userInput) {
    if (userInput == quizBank.getQuestionAnswer()) {scoreKeeper.add(score[2]);} else {scoreKeeper.add(score[3]);} 
    if (quizBank.isFininshed())  {
      Alert(context: context, title: "finished!", desc: "End of questions").show();
      scoreKeeper = [];
      useranswer = [];
      quizBank.reset();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() { 
                  useranswer.add(Icon( //add tick  to scoreKeeper list hard way
                    Icons.check,
                    color: Colors.green,
                  ));
                });
                checkAnswer(true);
                quizBank.nextQuestion();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() { // add x to scoreKeeper list from score list
                  useranswer.add(score[1]);
                });
                checkAnswer(false);
                quizBank.nextQuestion();
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        Row(
          children: useranswer,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
