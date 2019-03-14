import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String letter;
  final TextEditingController controller;

  TransparentButton({Key key, @required this.letter, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.all(Radius.elliptical(120, 120)),
        onTap: () {
          controller.text += letter;
        },
        child: Padding(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8.5),
          child: Text(
            letter,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "titillium",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
