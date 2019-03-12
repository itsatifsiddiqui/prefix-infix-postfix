import 'package:flutter/material.dart';
import 'package:infix_postfix_prefix/ui_styles/styles.dart';

class ConverterUI extends StatelessWidget {
  final sizebox = SizedBox(width: 10);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final w3 = mq.width / 3;
    final w1_8 = mq.width / 1.8;
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 12, bottom: 30, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: outlineButton("("),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: outlineButton(")"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: w1_8,
                  child: FittedBox(child: buttonRow(["7", "8", "9"])),
                ),
                sizebox,
                Container(
                  width: w3,
                  child: bigButton("%"),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: w1_8,
                  child: FittedBox(
                    child: buttonRow(["4", "5", "6"]),
                  ),
                ),
                sizebox,
                Container(
                  width: w3,
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        circularButton("^"),
                        circularButton("/")
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: w1_8,
                  child: FittedBox(child: buttonRow(["1", "2", "3"])),
                ),
                sizebox,
                Container(width: w3, child: bigButton("x")),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  width: w1_8,
                  child: Row(
                    children: <Widget>[
                      keyBoardButton(),
                      SizedBox(width: mq.width / 130),
                      TransparentButton(letter: "0"),
                    ],
                  ),
                ),
                sizebox,
                Container(
                  width: w3,
                  child: Container(
                    width: mq.width / 3,
                    child: FittedBox(
                      child: Row(
                        children: <Widget>[
                          circularButton("+"),
                          circularButton("-")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  FlatButton keyBoardButton() {
    return FlatButton(
      splashColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      // color: Color.fromRGBO(218, 242, 180, 1.0),
      color: Colors.deepOrangeAccent[100],
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: Text(
          "System\nKeyboard",
          textAlign: TextAlign.center,
          style: TextStyle(
              // color: Color.fromRGBO(96, 100, 94, 1.0),
              color: Colors.black87,
              fontSize: 15,
              letterSpacing: 4,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  RawMaterialButton circularButton(String letter) {
    return RawMaterialButton(
      onPressed: () {},
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      splashColor: Colors.black,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(18.0),
    );
  }

  FlatButton bigButton(String letter) {
    return FlatButton(
      splashColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      // color: Color.fromRGBO(218, 242, 180, 1.0),
      color: Colors.greenAccent[200],
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: Text(
          letter,
          textAlign: TextAlign.center,
          style: TextStyle(
              // color: Color.fromRGBO(96, 100, 94, 1.0),
              color: Colors.black87,
              fontSize: 28,
              letterSpacing: 60,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Row buttonRow(List<String> list) {
    return Row(
        children: list
            .map((letter) => TransparentButton(
                  letter: letter,
                ))
            .toList());
  }

  OutlineButton outlineButton(String letter) {
    return OutlineButton(
      borderSide: BorderSide(color: Color.fromRGBO(97, 103, 107, 1)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: () {},
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

class TransparentButton extends StatelessWidget {
  final Widget child;
  final String letter;

  TransparentButton({Key key, this.child, @required this.letter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.all(Radius.elliptical(120, 120)),
        onTap: () {},
        child: Padding(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
