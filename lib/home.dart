import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:infix_postfix_prefix/ui_styles/styles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Stack(
        children: <Widget>[
          clip(context),
          Align(
            alignment: Alignment(0, -0.80),
            child: Icon(
              EvaIcons.layersOutline,
              size: 110,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.47),
            child: Text(
              "PreFix   Infix   PostFix",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Times New Roman",
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
          ),
          prefixCard(context),
          infixCard(context),
          postfixCard(context)
        ],
      ),
    );
  }

  Align postfixCard(BuildContext context) {
    return Align(
          alignment: Alignment(0, 1),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.redAccent[100],
                        Colors.deepOrangeAccent[100]
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        "POSTFIX -> Prefix/Infix",
                        textAlign: TextAlign.center,
                        style: textHeader,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "AB+ -> +AB ",
                        textAlign: TextAlign.center,
                        style: textMedium,
                      ),
                      Text(
                        "AB+ -> A+B ",
                        textAlign: TextAlign.center,
                        style: textMedium,
                      ),
                    ],
                  )),
            ),
          ),
        );
  }

  Align infixCard(BuildContext context) {
    return Align(
          alignment: Alignment(0, 0.40),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purpleAccent[100],
                        Colors.deepPurpleAccent[100]
                      ],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        "INFIX -> Prefix/Postfix",
                        textAlign: TextAlign.center,
                        style: textHeader,
                      ),
                      SizedBox(height: 10),
                      Text("A+B -> AB+ ",
                          textAlign: TextAlign.center, style: textMedium),
                      Text(
                        "A+B -> +AB ",
                        textAlign: TextAlign.center,
                        style: textMedium,
                      ),
                    ],
                  )),
            ),
          ),
        );
  }

  Align prefixCard(BuildContext context) {
    return Align(
          alignment: Alignment(0, -0.20),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: lGradient(
                    colors: [
                      Colors.blueAccent[100],
                      Colors.lightBlueAccent[100]
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25),
                    Text(
                      "PREFIX -> Infix/Postfix",
                      textAlign: TextAlign.center,
                      style: textHeader,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "+AB -> A+B ",
                      textAlign: TextAlign.center,
                      style: textMedium,
                    ),
                    Text(
                      "+AB -> AB+ ",
                      textAlign: TextAlign.center,
                      style: textMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  ClipPath clip(BuildContext context) {
    return ClipPath(
          clipper: MyClipper(),
          child: Container(
            decoration: BoxDecoration(
                gradient: lGradient(
                    colors: [Colors.green[300], Colors.greenAccent[700]])),
            height: MediaQuery.of(context).size.height / 2.2,
          ),
        );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height / 1.22);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
