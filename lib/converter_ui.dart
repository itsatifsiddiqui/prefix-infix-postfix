import 'package:flutter/material.dart';

class ConverterUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(71, 76, 80, 100),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, bottom: 30, right: 16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    child: OutlineButton(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(97, 103, 107, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      child: Text(
                        "(",
                        style: TextStyle(fontSize: 20),
                      ),
                      highlightColor: Colors.black,
                      highlightedBorderColor: Colors.black,
                      disabledBorderColor: Colors.white,
                      textColor: Colors.cyan,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: OutlineButton(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(97, 103, 107, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {},
                      child: Text(
                        ")",
                        style: TextStyle(fontSize: 20),
                      ),
                      color: Colors.white,
                      highlightColor: Colors.black,
                      highlightedBorderColor: Colors.black,
                      disabledBorderColor: Colors.white,
                      textColor: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: mq.width / 1.8,
                  child: FittedBox(
                    child: Row(
                      children: ["7", "8", "9"]
                          .map((letter) => TransparentButton(
                                letter: letter,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: mq.width / 3,
                  child: FlatButton(
                    splashColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    // color: Color.fromRGBO(218, 242, 180, 1.0),
                    color: Colors.greenAccent[200],
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8.0),
                      child: Text(
                        "%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(96, 100, 94, 1.0),
                            color: Colors.black87,
                            fontSize: 28,
                            letterSpacing: 60,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: mq.width / 1.8,
                  child: FittedBox(
                    child: Row(
                      children: ["4", "5", "6"]
                          .map((letter) => TransparentButton(
                                letter: letter,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: mq.width / 3,
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        RawMaterialButton(
                          onPressed: () {},
                          child: Text(
                            "^",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          shape: new CircleBorder(),
                          elevation: 2.0,
                          splashColor: Colors.black,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(18.0),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          child: Text(
                            "/",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          shape: new CircleBorder(),
                          elevation: 2.0,
                          splashColor: Colors.black,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(18.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: mq.width / 1.8,
                  child: FittedBox(
                    child: Row(
                      children: ["7", "8", "9"]
                          .map((letter) => TransparentButton(
                                letter: letter,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: mq.width / 3,
                  child: FlatButton(
                    splashColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    // color: Color.fromRGBO(218, 242, 180, 1.0),
                    color: Colors.greenAccent[200],
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 8.0),
                      child: Text(
                        "x",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: Color.fromRGBO(96, 100, 94, 1.0),
                            color: Colors.black87,
                            fontSize: 28,
                            letterSpacing: 60,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12),
                  width: mq.width / 1.8,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        splashColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000)),
                        // color: Color.fromRGBO(218, 242, 180, 1.0),
                        color: Colors.greenAccent[200],
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 8.0),
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
                      ),
                      SizedBox(width: mq.width / 130),
                      TransparentButton(
                        letter: "0",
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: mq.width / 3,
                  child: Container(
                    width: mq.width / 3,
                    child: FittedBox(
                      child: Row(
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: () {},
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            splashColor: Colors.black,
                            fillColor: Colors.white,
                            padding: const EdgeInsets.all(18.0),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            splashColor: Colors.black,
                            fillColor: Colors.white,
                            padding: const EdgeInsets.all(18.0),
                          ),
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
}
// child: Table(
//   children: [
// TableRow(
//     children: ["7", "8", "9"]
//         .map<Widget>((letter) => TransparentButton(
//               letter: letter,
//             ))
//         .toList()),
//     //   TableRow(
//     //       children: ["4", "5", "6"]
//     //           .map<Widget>((letter) => TransparentButton(
//     //                 letter: letter,
//     //               ))
//     //           .toList()),
//     //   TableRow(
//     //       children: ["1", "2", "3"]
//     //           .map<Widget>((letter) => TransparentButton(
//     //                 letter: letter,
//     //               ))
//     //           .toList()),
//     //   TableRow(
//     //       children: ["0", "<", "3"]
//     //           .map<Widget>((letter) => TransparentButton(
//     //                 letter: letter,
//     //               ))
//     //           .toList()),
//   ],
// ),
//     );
//   ],
// ),
// }
// }

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
