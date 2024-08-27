import 'package:flutter/material.dart';
import '../models/number_model.dart';

class NumberViewModel extends ChangeNotifier {
  List<NumberModel> numbers = List.generate(100, (index) => NumberModel(value: index + 1));

  String selectedRule = 'Odd Numbers';

  void setRule(String rule) {
    selectedRule = rule;
    _applyRule();
  }

  void _applyRule() {
    for (var number in numbers) {
      switch (selectedRule) {
        case 'Odd Numbers':
          number.isHighlighted = number.value % 2 != 0;
          number.highlightColor = number.isHighlighted ? Colors.red : Colors.grey;
          break;
        case 'Even Numbers':
          number.isHighlighted = number.value % 2 == 0;
          number.highlightColor = number.isHighlighted ? Colors.blue : Colors.grey;
          break;
        case 'Prime Numbers':
          number.isHighlighted = _isPrime(number.value);
          number.highlightColor = number.isHighlighted ? Colors.green : Colors.grey;
          break;
        case 'Fibonacci Numbers':
          number.isHighlighted = _isFibonacci(number.value);
          number.highlightColor = number.isHighlighted ? Colors.yellow : Colors.grey;
          break;
        default:
          number.isHighlighted = false;
          number.highlightColor = Colors.grey;
      }
    }
    notifyListeners();
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool _isFibonacci(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = a;
      a = b;
      b = temp + b;
    }
    return b == number || number == 0;
  }
}
