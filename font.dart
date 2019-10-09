import 'package:math_expressions/math_expressions.dart';
import 'dart:math';
String equation = "0";
String result = "0";
String expression = "";
double equationFontSize = 38.0;
double resultFontSize = 48.0;

buttonPressed(String texte) {

    if (texte == "Del") {
      equation = "0";
      result = "0";
      equationFontSize = 38.0;
      resultFontSize = 48.0;
    } else if (texte == "⌫") {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (texte=="x²"){
      equationFontSize = 38.0;
      resultFontSize = 48.0;
      var f=int.parse(equation);
      result=pow(f, 2).toString();
    }else if (texte=="V"){
      equationFontSize = 38.0;
      resultFontSize = 48.0;
      result=sqrt(int.parse(equation)).toString();
    }
    else if (texte == "=") {
      equationFontSize = 38.0;
      resultFontSize = 48.0;

      expression = equation;
      expression = expression.replaceAll('x', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = "Error";
      }
    } else {
      equationFontSize = 48.0;
      resultFontSize = 38.0;
      if (equation == "0") {
        equation = texte;
      } else {
        equation = equation + texte;
      }
    }

}
