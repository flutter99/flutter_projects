import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  String _display = '0';
  String? _operation;
  String? _firstNumber;
  String? _secondNumber;

  String get display => _display;

  void handleButtonPress(String value) {
    switch (value) {
      case 'AC':
        _firstNumber = null;
        _secondNumber = null;
        _display = '0';
        _operation = null;
        break;
      case 'DC':
      // If the last character in _display is an operator, reset the _operation and _firstNumber
        if (_isOperator(_display[_display.length - 1])) {
          _operation = null;
          _firstNumber = null;
        }

        if (_display.length == 1 || (_display.length == 2 && _display.startsWith('-'))) {
          _display = '0';
        } else {
          _display = _display.substring(0, _display.length - 1);
        }
        break;
      case '%':
      case '/':
      case 'x':
      case '-':
      case '+':
        if (_operation == null) {
          _firstNumber = _display;
          _operation = value;
          _display += value;
        }
        break;
      case '=':
        if (_firstNumber != null && _operation != null) {
          _secondNumber = _display.replaceFirst(_firstNumber! + _operation!, "");
          var result = _calculate();
          if (result != null) {
            _display = result.toStringAsFixed(2).replaceAll(".00", "");
          } else {
            _display = "Error";
          }
          _firstNumber = null;
          _secondNumber = null;
          _operation = null;
        }
        break;
      case '.':
        if (!_display.endsWith('.') && !_display.split('').lastWhere(
                (e) => e == '.' || ['+', '-', 'x', '/', '%'].contains(e),
            orElse: () => '').contains('.')) {
          _display += '.';
        }
        break;
      default:
        _display == '0' ? _display = value : _display += value;
        break;
    }
    notifyListeners(); // Notify listeners whenever there's a change
  }

  double? _calculate() {
    var firstNum = double.tryParse(_firstNumber ?? "");
    var secondNum = double.tryParse(_secondNumber ?? "");
    if (firstNum == null || secondNum == null) return null;

    switch (_operation) {
      case '+':
        return firstNum + secondNum;
      case '-':
        return firstNum - secondNum;
      case 'x':
        return firstNum * secondNum;
      case '/':
        if (secondNum != 0) {
          return firstNum / secondNum;
        }
        break;
      case '%':
        return firstNum % secondNum;
      default:
        return null;
    }
    return null;
  }

  bool _isOperator(String s) {
    return ['+', '-', 'x', '/', '%'].contains(s);
  }

  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null || s == '00' || s == '.';
  }

  Color getButtonTextColor(String text, bool isDarkTheme) {
    if (_isNumeric(text)) {
      return isDarkTheme ? Colors.white : Colors.black;
    } else {
      return isDarkTheme ? Colors.lightGreenAccent : Colors.orange;
    }
  }
}
