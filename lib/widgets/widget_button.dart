// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:battery/utility/app_constant.dart';
import 'package:battery/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.label,
    required this.pressFunc,
    this.bgColor,
    this.textStyle,
  }) : super(key: key);

  final String label;
  final Function() pressFunc;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppConstant.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: pressFunc,
      child: WidgetText(data: label, textStyle: textStyle,),
    );
  }
}
