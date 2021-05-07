import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.heigth, this.weight});

  final int heigth;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(heigth / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'More execices';
    } else if (_bmi > 18.5) {
      return 'Good JOb';
    } else {
      return 'Eat More';
    }
  }
}
