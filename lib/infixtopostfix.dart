import 'dart:collection';
import 'dart:math' as math;

class Infix {
  static int _checPrecedence(String ch) {
    switch (ch) {
      case "+":
      case "-":
        return 1;
      case "*":
      case "x":
      case "X":
      case "/":
        return 2;
      case "^":
        return 3;
      default:
        return -1;
    }
  }

  static String toPostfixExpression(String exp) {
    String result = "";
    Queue<String> stack = new Queue<String>();
    String c;
    RegExp regex = new RegExp("[a-zA-Z0-9]+");

    for (var i = 0; i < exp.length; i++) {
      c = exp[i];
      if (regex.hasMatch(c))
        result += c;
      else if (c == '(')
        stack.add(c);
      else if (c == ')') {
        while (stack.isNotEmpty && stack.last != "(") {
          result += stack.removeLast();
        }

        if (stack.isEmpty)
          return "Invalid Expression"; // invalid expression
        else
          stack.removeLast();
      } else {
        while (stack.isNotEmpty &&
            _checPrecedence(c) <= _checPrecedence(stack.last)) {
          result += stack.removeLast();
        }
        stack.add(c);
      }
    }
    while (stack.isNotEmpty) {
      result += stack.removeLast();
    }
    return result;
  }
}
