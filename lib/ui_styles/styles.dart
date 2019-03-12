import 'package:flutter/material.dart';

LinearGradient lGradient({@required List<Color> colors}) => LinearGradient(
    colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight);

final textHeader = TextStyle(
  color: Colors.white,
  letterSpacing: 1,
  fontSize: 24,
);

final textMedium = TextStyle(
  color: Colors.white,
  letterSpacing: 1,
  fontSize: 16,
);

final bgColor = Color.fromRGBO(71, 76, 80, 100);
