import 'dart:math';

class CalculateBMIresult {
  final int tall;
  final int age;
  final int weight;

  CalculateBMIresult({required this.tall, required this.age, required this.weight});

  late double _bmi;

  double Calculate_BMI_score() {
    _bmi = weight / pow(tall/100, 2);
    return _bmi;
  }

  String Assessed_result() {
    if (_bmi >= 25) {
      return "overweight";
    } else if (_bmi > 18.5) {
      return "normal";
    } else {
      return "underweight";
    }
  }

  String FullText_result() {
    if (_bmi >= 25 && age < 10) {
      return "It is okay, you are still young";
    } else if (_bmi >= 25 && (age >= 10 && age < 20)) {
      return "You are a teenager, look after your body";
    } else if (_bmi >= 25 && age >=20 ) {
      return "You are old enough to understand your BMI is way too high! lose weight!";
    } else if (_bmi < 10 && age < 10 ) {
      return "malnutrition baby! eat more and sleep more, gain some weight please";
    } else if (_bmi <10 && (age >= 10 && age < 20)) {
      return "As a teenage, you are such a Skinny type, all your dress are quite small";
    } else if (_bmi <10 && age >= 20) {
      return "You are too thin, but at your age, might not be a bad thing!";
    }
    else {
      return "You are perfect, don't change anything and enjoy!";
    }
  }

}