import 'package:flutter/material.dart';
import 'package:infix_postfix_prefix/infixtopostfix.dart';
import 'package:infix_postfix_prefix/ui_styles/styles.dart';
import 'package:infix_postfix_prefix/widgets/bracket_button.dart';
import 'package:infix_postfix_prefix/widgets/circular_button.dart';
import 'package:infix_postfix_prefix/widgets/delete_button.dart';
import 'package:infix_postfix_prefix/widgets/transparent_button.dart';

class ConverterUI extends StatefulWidget {
  @override
  _ConverterUIState createState() => _ConverterUIState();
}

class _ConverterUIState extends State<ConverterUI> {
  final sizebox = SizedBox(width: 10);
  final node = FocusNode();

  final _controller = new TextEditingController();
  bool _keyboardFlag = false;

  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print(Infix.toPostfixExpression(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final w3 = mq.width / 3;
    final w1_8 = mq.width / 1.8;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.only(left: 12, bottom: 30, right: 16),
        child: ListView(
          reverse: true,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: w1_8,
                  child: FittedBox(
                      child: Row(
                    children: <Widget>[
                      sizebox,
                      buttonRow(["0", "."]),
                      DeleteButton(
                        controller: _controller,
                      )
                      // TransparentButton(
                      //   letter: "del",
                      //   controller: _controller,
                      // )
                    ],
                  )),
                ),
                sizebox,
                keyBoardButton()
              ],
            ),
            Row(
              children: [
                Container(
                  width: w1_8,
                  child: FittedBox(
                    child: buttonRow(["1", "2", "3"]),
                  ),
                ),
                sizebox,
                Container(
                  width: w3,
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        new CircularButton(
                          letter: "+",
                          controller: _controller,
                        ),
                        new CircularButton(
                          letter: "-",
                          controller: _controller,
                        )
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
                        new CircularButton(
                          letter: "*",
                          controller: _controller,
                        ),
                        new CircularButton(
                          letter: "/",
                          controller: _controller,
                        )
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
                  child: FittedBox(
                    child: buttonRow(["7", "8", "9"]),
                  ),
                ),
                sizebox,
                Container(
                  width: w3,
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        new CircularButton(
                          letter: "^",
                          controller: _controller,
                        ),
                        new CircularButton(
                          letter: "%",
                          controller: _controller,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: BracketButton(
                      letter: "(",
                      controller: _controller,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: BracketButton(
                      letter: ")",
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Text(
                    Infix.toPostfixExpression(
                            _controller.text.split('').reversed.join())
                        .split('')
                        .reversed
                        .join(),
                    maxLines: 1,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    Infix.toPostfixExpression(_controller.text),
                    maxLines: 1,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    toValue(),
                    style: TextStyle(fontSize: 25, color: Colors.green),
                    maxLines: 1,
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 4,
                  width: mq.width / 4,
                  color: Colors.red,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(microseconds: 100),
              alignment: Alignment.centerRight,
              child: TextField(
                enabled: _keyboardFlag,
                controller: _controller,
                focusNode: node,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero, border: InputBorder.none),
                style: TextStyle(
                  fontSize: fontsize(),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String toValue() {
    try {
      return Infix.toValue(_controller.text).toString();
    } catch (e) {
      return "";
    }
  }

  FlatButton keyBoardButton() {
    return FlatButton(
      splashColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      color: Colors.deepOrangeAccent[100],
      onPressed: () {
        print(_keyboardFlag);
        setState(() {
          _keyboardFlag = !_keyboardFlag;
          if (node.hasFocus) {
            node.unfocus();
          } else {
            FocusScope.of(context).requestFocus(node);
          }
        });
      },
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

  Row buttonRow(List<String> list) {
    return Row(
        children: list
            .map((letter) => TransparentButton(
                  letter: letter,
                  controller: _controller,
                ))
            .toList());
  }

  double fontsize() {
    int size = _controller.text.length;
    if (size < 6)
      return 60;
    else if (size < 9)
      return 55;
    else if (size < 12)
      return 50;
    else if (size < 15)
      return 45;
    else if (size < 18)
      return 40;
    else
      return 35;
  }
}
