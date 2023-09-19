import 'dart:convert';

import 'package:battery/models/question_model.dart';
import 'package:battery/models/user_model.dart';
import 'package:battery/states/main_home.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> readAllQuestion() async {
    String urlAPI =
        'https://www.androidthai.in.th/fluttertraining/BatteryAof/getAllQuestion.php';

    await Dio().get(urlAPI).then((value) {
      print('value ----> $value');

      var response = json.decode(value.data);
      print('response ---> $response');

      for (var element in response) {
        QuestionModel model = QuestionModel.fromMap(element);
        appController.questionModels.add(model);
      }
    });
  }

  Future<void> processRegister({required UserModel userModel}) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/batteryUng/insertUser.php?isAdd=true&nameSur=${userModel.nameSur}&phone=${userModel.phone}&email=${userModel.email}&brand=${userModel.brand}&numberModel=${userModel.numberModel}&model=${userModel.model}&color=${userModel.color}&nicName=${userModel.nicName}&idQuestion=${userModel.idQuestion}&answer=${userModel.answer}&password=${userModel.password}';

    await Dio().get(urlApi).then((value) {
      Get.back();
      Get.snackbar('สมัครบัญชี สำเร็จ', 'ยินดีด้วย',
          backgroundColor: AppConstant.blueColor, colorText: Colors.white);
    });
  }

  Future<void> checkLoginByEmail(
      {required String email, required String password}) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/batteryUng/getUserWhereEmail.php?isAdd=true&email=$email';

    await Dio().get(urlApi).then((value) {
      if (value.toString() == 'null') {
        Get.snackbar('Email False', 'ไม่มี email นี่ในฐานข้อมูล',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        for (var element in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(element);
          if (model.password == password) {
            GetStorage()
                .write('data', model.toMap())
                .then((value) => Get.offAll(const MainHome()));
          } else {
            Get.snackbar('Password False', 'ไม่มี password นี่ในฐานข้อมูล',
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        }
      }
    });
  }

  Future<void> checkLoginByPhone(
      {required String phone, required String password}) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/batteryUng/getUserWherePhone.php?isAdd=true&phone=$phone';

    await Dio().get(urlApi).then((value) {
      if (value.toString() == 'null') {
        Get.snackbar('Phone False', 'ไม่มี Phone นี่ในฐานข้อมูล',
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        for (var element in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(element);
          if (model.password == password) {
            GetStorage()
                .write('data', model.toMap())
                .then((value) => Get.offAll(const MainHome()));
          } else {
            Get.snackbar('Password False', 'ไม่มี password นี่ในฐานข้อมูล',
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        }
      }
    });
  }

  Future<void> findUserModelLogin() async {
    var data = GetStorage().read('data');
    UserModel model = UserModel.fromMap(data);
    appController.userModelLogins.add(model);
  }
}
