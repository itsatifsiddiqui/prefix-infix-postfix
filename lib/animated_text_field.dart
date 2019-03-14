// import 'package:flutter/material.dart';

// class AnimatedTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final FocusNode node;
//   final bool keyboardFlag;
//   AnimatedTextField({this.controller, this.node, this.keyboardFlag});
//   double height = 60;

//   @override
//   Widget build(BuildContext context) {
//     print(height);
//     return AnimatedContainer(
//       duration: Duration(seconds: 1),
//       height: height,
//       child: TextField(
//         enabled: keyboardFlag,
//         controller: controller,
//         focusNode: node,
//         textDirection: TextDirection.ltr,
//         textAlign: TextAlign.end,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.zero, border: InputBorder.none),
//         style: TextStyle(
//           fontSize: fontsize(),
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

  
// }
