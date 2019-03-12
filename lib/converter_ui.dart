import 'package:flutter/material.dart';

class ConverterUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(71, 76, 80, 100),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, bottom: 4),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                Row(
                  children: ["7", "8", "9"]
                      .map((letter) => TransparentButton(
                            letter: letter,
                          ))
                      .toList(),
                )
              ],
            ),
            Row(
              children: [
                Row(
                  children: ["4", "5", "6"]
                      .map((letter) => TransparentButton(
                            letter: letter,
                          ))
                      .toList(),
                )
              ],
            ),
            Row(
              children: [
                Row(
                  children: ["1", "2", "3"]
                      .map((letter) => TransparentButton(
                            letter: letter,
                          ))
                      .toList(),
                )
              ],
            ),
            Row(
              children: [
                Row(
                  children: <Widget>[
                    TransparentButton(
                      letter: "0",
                    ),
                    Container(
                      child: FlatButton(
                        splashColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000)),
                        // color: Color.fromRGBO(218, 242, 180, 1.0),
                        color: Colors.greenAccent[200],
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 8.0),
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
                    )
                  ],
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
      padding: EdgeInsets.all(4),
      child: InkWell(
        splashColor: Colors.black,
        borderRadius: BorderRadius.all(Radius.elliptical(120, 120)),
        onTap: () {},
        child: Padding(
          // padding: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 12),
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
