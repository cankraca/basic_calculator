import 'package:calculator/color_constants.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'my_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userQuestion = '';
  String userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userQuestion,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    userAnswer,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          MyButton(
                            text: 'AC',
                            textColor: ColorConstants.green,
                            onPressed: () => _clearMethod(),
                          ),
                          MyButton(
                              text: '+/-',
                              textColor: ColorConstants.green,
                              onPressed: () => _signMethod()),
                          MyButton(
                            text: '%',
                            textColor: ColorConstants.green,
                            onPressed: () => _addOperationMethod('%'),
                          ),
                          MyButton(
                            text: '/',
                            textColor: ColorConstants.red,
                            onPressed: () => _addOperationMethod('/'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            text: '7',
                            onPressed: () => _addMethod('7'),
                          ),
                          MyButton(
                            text: '8',
                            onPressed: () => _addMethod('8'),
                          ),
                          MyButton(
                            text: '9',
                            onPressed: () => _addMethod('9'),
                          ),
                          MyButton(
                            text: 'x',
                            textColor: ColorConstants.red,
                            onPressed: () => _addOperationMethod('x'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            text: '4',
                            onPressed: () => _addMethod('4'),
                          ),
                          MyButton(
                            text: '5',
                            onPressed: () => _addMethod('5'),
                          ),
                          MyButton(
                            text: '6',
                            onPressed: () => _addMethod('6'),
                          ),
                          MyButton(
                            text: '–',
                            textColor: ColorConstants.red,
                            onPressed: () => _addOperationMethod('-'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            text: '1',
                            onPressed: () => _addMethod('1'),
                          ),
                          MyButton(
                            text: '2',
                            onPressed: () => _addMethod('2'),
                          ),
                          MyButton(
                            text: '3',
                            onPressed: () => _addMethod('3'),
                          ),
                          MyButton(
                            text: '+',
                            textColor: ColorConstants.red,
                            onPressed: () => _addOperationMethod('+'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            text: '<',
                            onPressed: () => _removeMethod(),
                          ),
                          MyButton(
                            text: '0',
                            onPressed: () => _addMethod('0'),
                          ),
                          MyButton(
                            text: '.',
                            onPressed: () => _addOperationMethod('.'),
                          ),
                          MyButton(
                            text: '=',
                            textColor: ColorConstants.red,
                            onPressed: () => _evaluateMethod(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addMethod(String item) {
    setState(
      () {
        userQuestion += item;
      },
    );
  }

  void _addOperationMethod(String item) {
    setState(
      () {
        if (userQuestion.isNotEmpty &&
            double.tryParse(userQuestion[userQuestion.length - 1]) != null)
          userQuestion += item;
      },
    );
  }

  void _removeMethod() {
    setState(() {
      if (userQuestion.isNotEmpty)
        userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    });
  }

  void _clearMethod() {
    setState(() {
      userQuestion = '';
      userAnswer = '';
    });
  }

  void _evaluateMethod() {
    setState(
      () {
        String finalQuestion = userQuestion.replaceAll("x", "*");
        finalQuestion = finalQuestion.replaceAll('%', '/100*');
        if (finalQuestion.isNotEmpty) {
          Parser p = Parser();
          Expression exp = p.parse(finalQuestion);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          userAnswer = eval.toString();
        }
      },
    );
  }

  void _signMethod() {
    setState(
      () {
        if (userAnswer.isNotEmpty) {
          userAnswer.startsWith('-')
              ? userAnswer = userAnswer.substring(1)
              : userAnswer = '-' + userAnswer;
        }
      },
    );
  }
}
