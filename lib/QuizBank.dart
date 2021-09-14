import 'StringBooleanDict.dart';

class QuizBank {

  int _questionNumber = 0; //_variable makes it private
  List<StringBooleanDict> qas = [StringBooleanDict(s: 'You can lead a cow down stairs but not up stairs.', a: false), 
                            StringBooleanDict(s: 'Approximately one quarter of human bones are in the feet.', a: true),
                            StringBooleanDict(s: 'A slug\'s blood is green.', a: true) ];


  List<StringBooleanDict> _qas = [ //_variable makes it private
    StringBooleanDict(s: 'Some cats are actually allergic to humans',a: true),
    StringBooleanDict(s: 'You can lead a cow down stairs but not up stairs.', a: false),
    StringBooleanDict(s: 'Approximately one quarter of human bones are in the feet.', a: true),
    StringBooleanDict(s: 'A slug\'s blood is green.', a: true),
    StringBooleanDict(s: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    StringBooleanDict(s: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    StringBooleanDict(s: 'No piece of square dry paper can be folded in half more than 7 times.', a: false),
    StringBooleanDict(s: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    StringBooleanDict(s: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    StringBooleanDict(
        s: 'The total surface area of two human lungs is approximately 70 square metres.', a: true),
    StringBooleanDict(s: 'Google was originally called \"Backrub\".', a: true),
    StringBooleanDict(s: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    StringBooleanDict(s: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];




  String getQuestionText() { // main() can call and access question text
    return _qas[_questionNumber].s;
  }
  bool getQuestionAnswer() { // like above method, encapsulate answer retrieval
    return _qas[_questionNumber].a;
  }

  void nextQuestion() {
    if (_questionNumber < _qas.length -1) {
      _questionNumber++;
    }
  }

  bool isFininshed() {
    if (_questionNumber >= _qas.length -1) {
        return true;
    } else {
        return false;
    }
  }
  void reset() {
    _questionNumber = 0;
  }
}