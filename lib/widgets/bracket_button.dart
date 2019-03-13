import 'package:flutter/material.dart';

class BracketButton extends StatelessWidget {
  const BracketButton(
      {Key key, @required this.letter, @required this.controller})
      : super(key: key);

  final String letter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: Color.fromRGBO(97, 103, 107, 1)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: () => controller.text += letter,
      child: Text(
        letter,
        style: TextStyle(fontSize: 20),
      ),
      highlightColor: Colors.black,
      highlightedBorderColor: Colors.black,
      disabledBorderColor: Colors.white,
      textColor: Colors.cyan,
    );
  }
}
