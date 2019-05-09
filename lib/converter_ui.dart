import 'package:flutter/material.dart';
import 'package:infix_postfix_prefix/infixtopostfix.dart';
import 'package:infix_postfix_prefix/ui_styles/styles.dart';
import 'package:infix_postfix_prefix/widgets/bracket_button.dart';
import 'package:infix_postfix_prefix/widgets/circular_button.dart';
import 'package:infix_postfix_prefix/widgets/delete_button.dart';
import 'package:infix_postfix_prefix/widgets/row_end_text.dart';
import 'package:infix_postfix_prefix/widgets/transparent_button.dart';
import 'dart:math' as math;

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
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;

    final redLine = Padding(
      padding: largePhone
          ? const EdgeInsets.only(bottom: 15.0, right: 20, top: 6)
          : const EdgeInsets.only(bottom: 10.0, right: 17),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 4,
          width: mq.width / 4,
          color: Colors.red,
        ),
      ),
    );
    final textInput = Padding(
      padding: largePhone
          ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
      child: SingleChildScrollView(
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
    );
    final expressionTag = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 22, top: 25),
        child: Text(
          "EXPRESSION",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "titillium",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: bgColor,
      appBar: (largePhone)
          ? AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              title: Text(
                "Infinix Converter",
                style: TextStyle(
                  fontFamily: "titillium",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: mq * 0.085,
              child: AppBar(
                  backgroundColor: bgColor,
                  elevation: 2,
                  title: Text(
                    "Infinix Converter",
                    style: TextStyle(
                      fontFamily: "titillium",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            if (largePhone) expressionTag,
            textInput,
            redLine,
            RowEndText(label: "Prefix", answer: toValue()),
            RowEndText(label: "Postfix", answer: toValue()),
            RowEndText(label: "Value", answer: toValue(), color: Colors.green),
            Row(
              children: <Widget>[
                for (var item in ["(", ")"])
                  BracketButton(letter: item, controller: _controller)
              ],
            ),
            Row(
              children: <Widget>[
                for (var item in ["7", "8", "9"])
                  Expanded(
                    child: TransparentButton(
                        letter: item, controller: _controller),
                  ),
                ...[
                  for (var item in ['^', '%'])
                    Expanded(
                      child:
                          CircularButton(letter: item, controller: _controller),
                    )
                ],
              ],
            ),
            Row(
              children: <Widget>[
                for (var item in ["4", "5", "6"])
                  Expanded(
                    child: TransparentButton(
                        letter: item, controller: _controller),
                  ),
                ...[
                  for (var item in ['\u{00D7}', '\u{00F7}'])
                    Expanded(
                      child:
                          CircularButton(letter: item, controller: _controller),
                    )
                ],
              ],
            ),
            Row(
              children: <Widget>[
                for (var item in ["1", "2", "3"])
                  Expanded(
                    child: TransparentButton(
                        letter: item, controller: _controller),
                  ),
                ...[
                  for (var item in ["+", "-"])
                    Expanded(
                      child:
                          CircularButton(letter: item, controller: _controller),
                    )
                ],
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Row(
                children: <Widget>[
                  for (var item in ["0", "."])
                    Expanded(
                        flex: 2,
                        child: TransparentButton(
                          letter: item,
                          controller: _controller,
                        )),
                  ...[DeleteButton(controller: _controller), keyBoardButton()],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String toValue() {
    try {
      if (_controller.text.length == 0) return "";
      String value = Infix.toValue(_controller.text).toString();
      if (value.substring(value.length - 2, value.length) == ".0")
        return value.substring(0, value.length - 2);
      else {
        print(double.parse(value));
        return double.parse(value).toStringAsFixed(2);
      }
    } catch (e) {
      return "INVALID EXPRESSION";
    }
  }

  Expanded keyBoardButton() {
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 2),
        child: FlatButton(
          padding: largePhone ? EdgeInsets.all(8) : EdgeInsets.zero,
          splashColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
          color: Colors.deepOrangeAccent[100],
          onPressed: () {
            setState(() {
              _keyboardFlag = !_keyboardFlag;
              if (node.hasFocus) {
                node.unfocus();
              } else {
                FocusScope.of(context).requestFocus(node);
              }
            });
          },
          child: Text(
            "System\nKeyboard",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black87,
                fontSize: largePhone ? 14 : 10,
                letterSpacing: 2,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  double fontsize() {
    int size = _controller.text.length;
    final mq = MediaQuery.of(context).size;
    final largePhone = mq.width > 380;
    if (largePhone) {
      if (size < 10)
        return 40;
      else if (size < 12)
        return 35;
      else
        return 30;
    } else {
      if (size < 10)
        return 55;
      else if (size < 12)
        return 50;
      else if (size < 14)
        return 45;
      else if (size < 16)
        return 40;
      else
        return 35;
    }
  }
}
