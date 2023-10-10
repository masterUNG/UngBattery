import 'package:battery/states/add_motocycle.dart';
import 'package:battery/states/list_near_station.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_button.dart';
import 'package:battery/widgets/widget_icon_button.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return Obx(() {
        return appController.userModelLogins.isEmpty
            ? const SizedBox()
            : ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                children: [
                  WidgetText(
                    data: appController.userModelLogins.last.nameSur,
                    textStyle: AppConstant().h1(),
                  ),
                  const SizedBox(
                    width: 16,
                    height: 16,
                  ),
                  WidgetText(
                    data: 'เลือกรถของคุณ',
                    textStyle: AppConstant().h2(),
                  ),
                  const SizedBox(
                    width: 16,
                    height: 16,
                  ),
                  appController.motoModels.isEmpty
                      ? const SizedBox()
                      : Column(
                          children: [
                            Row(
                              children: [
                                WidgetIconButton(
                                  iconData: Icons.directions_bike,
                                  pressFunc: () {
                                    Get.to(const AddMotocycle())!.then(
                                        (value) => AppService()
                                            .checkHaveMotocycle(
                                                idOwner: appController
                                                    .userModelLogins.last.id!));
                                  },
                                ),
                                SizedBox(
                                  width: boxConstraints.maxWidth - 32 - 36 - 12,
                                  child: DropdownButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    isExpanded: true,
                                    hint:
                                        const WidgetText(data: 'เลือกรถของคุณ'),
                                    value: appController.chooseMotoModels.last,
                                    items: appController.motoModels
                                        .map(
                                          (element) => DropdownMenuItem(
                                            child: WidgetText(
                                                data:
                                                    '${element.nickname} (${element.model}, ${element.color})'),
                                            value: element,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      appController.chooseMotoModels.add(value);
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 16,
                              height: 16,
                            ),
                            appController.chooseMotoModels.last == null
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: 150,
                                          decoration:
                                              AppConstant().ballGreyBorder(),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: appController
                                                        .chooseMotoModels
                                                        .last!
                                                        .statusBatt!
                                                        .isEmpty
                                                    ? const SizedBox()
                                                    : SizedBox(
                                                        height: 80,
                                                        child:
                                                            CircularPercentIndicator(
                                                          lineWidth: 10,
                                                          progressColor:
                                                              Colors.blue,
                                                          radius: 40,
                                                          percent: double.parse(
                                                                  appController
                                                                      .chooseMotoModels
                                                                      .last!
                                                                      .statusBatt!) /
                                                              100,
                                                          center: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const WidgetText(
                                                                  data:
                                                                      'สถานะ'),
                                                              WidgetText(
                                                                data:
                                                                    '${appController.chooseMotoModels.last!.statusBatt!} %',
                                                                textStyle:
                                                                    AppConstant()
                                                                        .h2(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: appController
                                                        .chooseMotoModels
                                                        .last!
                                                        .distance!
                                                        .isEmpty
                                                    ? const SizedBox()
                                                    : Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const WidgetText(
                                                              data:
                                                                  'ระยะทางที่วิ่งได้'),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              WidgetText(
                                                                data: appController
                                                                    .chooseMotoModels
                                                                    .last!
                                                                    .distance!,
                                                                textStyle:
                                                                    AppConstant()
                                                                        .h2(),
                                                              ),
                                                              const WidgetText(
                                                                  data: 'กม   ')
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                        height: 16,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          height: 150,
                                          decoration:
                                              AppConstant().ballGreyBorder(),
                                          child: appController.chooseMotoModels
                                                  .last!.package!.isEmpty
                                              ? const SizedBox()
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const WidgetText(
                                                        data: 'Package เหลือ'),
                                                    WidgetText(
                                                      data: appController
                                                          .chooseMotoModels
                                                          .last!
                                                          .package!,
                                                      textStyle:
                                                          AppConstant().h2(),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                            WidgetButton(
                              label: 'Near Station',
                              pressFunc: () {
                                Get.to(const ListNearStation());  
                              },
                            ),
                          ],
                        ),
                ],
              );
      });
    });
  }
}
