import 'package:battery/states/register.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_button.dart';
import 'package:battery/widgets/widget_form.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:battery/widgets/widget_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.greenColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 32, bottom: 16),
                child: WidgetText(
                  data: 'ล๊อคอิน/ล๊อคเอาท์',
                  textStyle: AppConstant().h2White(),
                ),
              ),
              Container(
                decoration: AppConstant().curveWhite(),
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.8,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 48,
                            ),
                            const WidgetText(
                                data: 'อีเมลหรือเบอร์โทรศัพท์ที่ลงทะเบียนไว้'),
                            Container(
                              margin: const EdgeInsets.only(top: 8, bottom: 32),
                              width: 250,
                              child: WidgetForm(
                                textEditingController: userController,
                                hint: 'อีเมลหรือเบอร์โทรศัพท์',
                              ),
                            ),
                            const WidgetText(data: 'รหัสผ่าน'),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: 250,
                              child: WidgetForm(
                                textEditingController: passwordController,
                                obcecu: true,
                                hint: 'รหัสผ่าน',
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Row(
                                children: [
                                  WidgetTextButton(
                                    label: 'ลืมรหัสผ่าน ?',
                                    pressFunc: () {},
                                  ),
                                ],
                              ),
                            ),
                            WidgetButton(
                              label: 'ล๊อคอิน',
                              pressFunc: () {
                                if (userController.text.isEmpty) {
                                  Get.snackbar(
                                      'อีเมลหรือเบอร์โทรศัพท์ที่ลงทะเบียนไว้',
                                      'Please fill อีเมลหรือเบอร์โทรศัพท์ที่ลงทะเบียนไว้');
                                } else if (passwordController.text.isEmpty) {
                                  Get.snackbar(
                                      'รหัสผ่าน', 'Please fill รหัสผ่าน');
                                } else if (userController.text.isEmail) {
                                  //login by email
                                  AppService().checkLoginByEmail(
                                      email: userController.text,
                                      password: passwordController.text);
                                } else {
                                  //login by phone
                                  AppService().checkLoginByPhone(
                                      phone: userController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                            // WidgetTextButton(
                            //   label: 'ยังไม่มีบัญชี',
                            //   pressFunc: () {
                            //     Get.to(const Register());
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
