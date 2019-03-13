import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key, @required this.letter, @required this.controller})
      : super(key: key);

  final String letter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => controller.text = controller.text + letter,
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      splashColor: Colors.black ,
      fillColor: Colors.deepPurple[50],
      padding: const EdgeInsets.all(18.0),
    );
  }
}
