import 'package:flutter/material.dart';

class BracketButton extends StatelessWidget {
  const BracketButton({Key? key, required this.letter, required this.controller})
      : super(key: key);

  final String letter;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return Expanded(
      child: Padding(
        padding: largePhone
            ? const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4)
            : const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
        child: Container(
          height: largePhone ? 40 : 30,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            // borderSide: BorderSide(color: Color.fromRGBO(97, 103, 107, 1)),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
            onPressed: () => controller.text += letter,
            child: Text(
              letter,
              style: TextStyle(fontSize: 15),
            ),
            // highlightColor: Colors.black,
            // highlightedBorderColor: Colors.black,
            // disabledBorderColor: Colors.white,
            // textColor: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
