import 'package:battery/bodys/body_home.dart';
import 'package:battery/bodys/body_motercycle.dart';
import 'package:battery/bodys/body_profile.dart';
import 'package:battery/bodys/body_station.dart';
import 'package:battery/bodys/body_wallet.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_icon_button.dart';
import 'package:battery/widgets/widget_menu.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'หน้าหลัก',
    'สถานี',
    'กระเป๋า',
    'มอไซด์',
    'บัญชี',
  ];

  var icons = <IconData>[
    Icons.home,
    Icons.build,
    Icons.wallet,
    Icons.directions_bike,
    Icons.person,
  ];

  var bodys = <Widget>[
    const BodyHome(),
    const BodyStation(),
    const BodyWallet(),
    const BodyMotercycle(),
    const BodyProfile(),
  ];

  var items = <BottomNavigationBarItem>[];

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    AppService().findUserModelLogin();

    for (var i = 0; i < titles.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.grey,
          actions: [
            WidgetIconButton(
              iconData: Icons.notifications,
              color: Colors.deepOrange,
              pressFunc: () {},
            ),
            WidgetIconButton(
              iconData: Icons.qr_code_scanner,
              pressFunc: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: null, accountEmail: null),
              WidgetMenu(
                leadWidget: const Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                titleWidget: WidgetText(
                  data: 'ออกจากระบบ',
                  textStyle: AppConstant().h2White(color: Colors.black),
                ),
                subTitleWidget:
                    const WidgetText(data: 'ออกจากระบบ แล้วไป login ใหม่'),
                tapFunc: () {
                  GetStorage().remove('data').then((value) {
                    Get.offAllNamed('/authen');
                    Get.snackbar('SignOut Success', 'Please Login Again');
                  });
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          onTap: (value) {
            appController.indexBody.value = value;
          },
          currentIndex: appController.indexBody.value,
          unselectedItemColor: AppConstant.greenColor,
          selectedItemColor: AppConstant.blueColor,
          type: BottomNavigationBarType.fixed,
        ),
        body: bodys[appController.indexBody.value],
      );
    });
  }
}
