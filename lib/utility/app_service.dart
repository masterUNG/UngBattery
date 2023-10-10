import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:battery/models/moto_model.dart';
import 'package:battery/models/question_model.dart';
import 'package:battery/models/user_model.dart';
import 'package:battery/states/add_motocycle.dart';
import 'package:battery/states/main_home.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:battery/utility/app_dialog.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:battery/widgets/widget_text_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

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
    String urlApi = '';

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
    print('## userModelLosin---> ${model.toMap()}');
    appController.userModelLogins.add(model);
  }

  Future<void> checkHaveMotocycle({required String idOwner}) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/batteryUng/getMotorWhereIdOwner.php?isAdd=true&idOwner=$idOwner';

    await Dio().get(urlApi).then((value) {
      if (appController.motoModels.isNotEmpty) {
        appController.motoModels.clear();
        appController.chooseMotoModels.clear();
        appController.chooseMotoModels.add(null);
      }

      if (value.toString() == 'null') {
        AppDialog().normalDialog(
          titleWidget: const WidgetText(data: 'ยังไม่มีรถมอเตอร์ไซด์'),
          contentWidget:
              const WidgetText(data: 'โปรด Add MotorCycle อย่างน้อง 1 คัน'),
          firstButtonWidget: WidgetTextButton(
            label: 'Add MotoCycle',
            pressFunc: () {
              Get.back();
              Get.to(const AddMotocycle());
            },
          ),
          buttonWidget: WidgetTextButton(
            label: 'Cancel',
            pressFunc: () {
              Get.back();
            },
          ),
        );
      } else {
        for (var element in json.decode(value.data)) {
          MotoModel motoModel = MotoModel.fromMap(element);
          appController.motoModels.add(motoModel);
        }
      }
    });
  }

  Future<void> processAddMotocycle({
    required String brand,
    required String numberModel,
    required String model,
    required String color,
    required String nicName,
  }) async {
    String urlApi =
        'https://www.androidthai.in.th/fluttertraining/batteryUng/addNewMotoCycle.php?isAdd=true&idOwner=${appController.userModelLogins.last.id}&brand=$brand&numberModel=$numberModel&model=$model&color=$color&nickname=$nicName';

    await Dio().get(urlApi).then((value) {
      Get.back();
    });
  }

  Future<Position?> findMyLocation() async {
    bool locationService = await Geolocator.isLocationServiceEnabled();
    LocationPermission? locationPermission;
    Position? position;

    if (locationService) {
      //เปิด Location

      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.deniedForever) {
        AppDialog().normalDialog(
            titleWidget: const WidgetText(data: 'Please Open Location'),
            buttonWidget: WidgetTextButton(
              label: 'Open Persion',
              pressFunc: () {
                Geolocator.openAppSettings();
                exit(0);
              },
            ));
      } else {
        if (locationPermission == LocationPermission.denied) {
          //Denied
          locationPermission = await Geolocator.requestPermission();

          if ((locationPermission != LocationPermission.always) &&
              (locationPermission != LocationPermission.whileInUse)) {
            AppDialog().normalDialog(
                titleWidget: const WidgetText(data: 'Please Open Location'),
                buttonWidget: WidgetTextButton(
                  label: 'Open Persion',
                  pressFunc: () {
                    Geolocator.openAppSettings();
                    exit(0);
                  },
                ));
          } else {
            position = await Geolocator.getCurrentPosition();
          }
        } else {
          position = await Geolocator.getCurrentPosition();
        }
      }
    } else {
      AppDialog().normalDialog(
          titleWidget: const WidgetText(data: 'Please Open Location'),
          buttonWidget: WidgetTextButton(
            label: 'Open Location',
            pressFunc: () {
              Geolocator.openLocationSettings();
              exit(0);
            },
          ));
    }

    return position;
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    double distance = 0;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  }

  String reFormatNumber({required double number}) {
    NumberFormat numberFormat = NumberFormat('##0.0#', 'en_US');
    return numberFormat.format(number);
  }
}
