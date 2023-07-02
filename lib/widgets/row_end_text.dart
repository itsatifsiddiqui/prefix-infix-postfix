import 'package:flutter/material.dart';

class RowEndText extends StatelessWidget {
  final String label;
  final String answer;
  final Color color;

  const RowEndText(
      {Key? key,
      required this.label,
      required this.answer,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: largePhone ? 16 : 14,
                fontFamily: "titillium"),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                answer,
                style: TextStyle(
                    fontSize: largePhone ? 22 : 18,
                    height: 0.9,
                    color: color,
                    fontFamily: "titillium"),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
