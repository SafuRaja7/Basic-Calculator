import 'package:math_expressions/math_expressions.dart';

class AppUtils {
  static  String input = '';
  static  String output = '';
  static const List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  static bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

 static void equalPressed() {
    String finalInput = input;
    Parser parser = Parser();
    finalInput = finalInput.replaceAll('x', '*');
    Expression exp = parser.parse(finalInput);

    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
    output = eval.toString();
  }
}
