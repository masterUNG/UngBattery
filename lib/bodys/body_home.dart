import 'package:battery/utility/app_controller.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return appController.userModelLogins.isEmpty ?  const SizedBox() : WidgetText(data: appController.userModelLogins.last.nameSur);
      }
    );
  }
}
