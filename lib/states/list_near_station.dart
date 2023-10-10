import 'dart:convert';

import 'package:battery/models/station_model.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ListNearStation extends StatefulWidget {
  const ListNearStation({super.key});

  @override
  State<ListNearStation> createState() => _ListNearStationState();
}

class _ListNearStationState extends State<ListNearStation> {
  Position? position;
  List<Map<String, dynamic>> mapStations = [];

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    AppService().findMyLocation().then((value) async {
      position = value;
      print('## MyPosition ---> $position');

      String urlApi =
          'https://www.androidthai.in.th/fluttertraining/batteryUng/getAllStation.php';

      await Dio().get(urlApi).then((value) {
        for (var element in json.decode(value.data)) {
          StationModel stationModel = StationModel.fromMap(element);

          double distance = AppService().calculateDistance(
              position!.latitude,
              position!.longitude,
              double.parse(stationModel.lat),
              double.parse(stationModel.lng));

          Map<String, dynamic> map = stationModel.toMap();
          map['distance'] = distance;

          // print('## map ----> $map');
          mapStations.add(map);

          // print('## distance ----> $distance');
          // print('## stationMOdel ---> ${stationModel.toMap()}');
        }

        print('## ก่อน mapStations ---> $mapStations');

        mapStations.sort((a, b) => a['distance'].compareTo(b['distance']));

        print('## After mapStations ---> $mapStations');

        for (var element in mapStations) {
          StationModel stationModel = StationModel.fromMap(element);
          appController.stationModels.add(stationModel);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Near Station'),
      ),
      body: Obx(() {
        return ListView(
          children: [
            WidgetText(
              data: 'เรียงลำดับจากสถานี่ใกล้สุด',
              textStyle: AppConstant().h2(),
            ),
            appController.stationModels.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: appController.stationModels.length,
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetText(
                            data: appController.stationModels[index].name),
                        WidgetText(
                          data:
                              '${AppService().reFormatNumber(number: appController.stationModels[index].distance!)} Km.',
                          textStyle: AppConstant().h3(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
