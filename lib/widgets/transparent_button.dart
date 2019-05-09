import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String letter;
  final TextEditingController controller;

  TransparentButton(
      {Key key,
      @required this.letter,
      @required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return InkWell(
      splashColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      onTap: () {
        controller.text += letter;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8.5),
        child: Text(
          letter,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "titillium",
            fontWeight: FontWeight.bold,
            fontSize: largePhone?36:30,
          ),
        ),
      ),
    );
  }
}
