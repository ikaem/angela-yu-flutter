import 'dart:math';

class BMI {
  final int height;
  final int weight;
  late double _bmi;

  BMI(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    }

    if (_bmi > 18.5) {
      return "Normal";
    }

    return "Underweight";
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Too much";
    }

    if (_bmi > 18.5) {
      return "All good";
    }

    return "Mh...";
  }
}
