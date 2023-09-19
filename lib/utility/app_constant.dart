import 'package:flutter/material.dart';

class AppConstant {
  static Color greenColor = const Color.fromARGB(255, 74, 187, 78);
  static Color blueColor = const Color.fromARGB(255, 45, 63, 167);

  TextStyle h2White({Color? color}) =>  TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: color ?? Colors.white);

  BoxDecoration curveWhite() => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      );

  BoxDecoration ballGrey() => BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      );

  BoxDecoration ballWhite() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      );
}
