import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, this.controller}) : super(key: key);

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return GestureDetector(
      onLongPress: () => controller!.text = "",
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.all(Radius.elliptical(120, 120)),
        onTap: () => controller!.text =
            controller!.text.substring(0, controller!.text.length - 1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Text(
            "DEL",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "titillium",
              fontWeight: FontWeight.bold,
              fontSize: largePhone ? 20 : 12,
            ),
          ),
        ),
      ),
    );
  }
}
