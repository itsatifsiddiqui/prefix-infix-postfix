import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key, @required this.letter, @required this.controller})
      : super(key: key);

  final String letter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RawMaterialButton(
        onPressed: () => controller.text = controller.text + letter,
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        shape: CircleBorder(),
        elevation: 2.0,
        splashColor: Colors.black,
        fillColor: Colors.deepPurple[50],
        padding: largePhone
            ? const EdgeInsets.all(15.0)
            : const EdgeInsets.all(10.0),
      ),
    );
  }
}
