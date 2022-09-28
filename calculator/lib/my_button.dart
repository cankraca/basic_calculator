import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final onPressed;
  final Color? textColor;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
