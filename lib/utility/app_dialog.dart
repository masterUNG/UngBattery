import 'package:battery/widgets/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  void normalDialog({
    Widget? iconWidget,
    required Widget titleWidget,
    Widget? contentWidget,
    Widget? buttonWidget,
    Widget? firstButtonWidget,
  }) {
    Get.dialog(
        AlertDialog(
          icon: iconWidget,
          title: titleWidget,
          content: contentWidget,
          actions: [
            firstButtonWidget ?? const SizedBox(),
            buttonWidget ??
                WidgetTextButton(
                  label: 'OK',
                  pressFunc: () {
                    Get.back();
                  },
                )
          ],
        ),
        barrierDismissible: false);
  }
}
