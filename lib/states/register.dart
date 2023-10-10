import 'package:battery/models/user_model.dart';
import 'package:battery/utility/app_constant.dart';
import 'package:battery/utility/app_controller.dart';
import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_button.dart';
import 'package:battery/widgets/widget_form.dart';
import 'package:battery/widgets/widget_icon_button.dart';
import 'package:battery/widgets/widget_image.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AppController appController = Get.put(AppController());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController numberModelController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController nicNameController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    AppService().readAllQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.greenColor,
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              head(boxConstraints),
              Container(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxHeight * 0.7,
                decoration: AppConstant().curveWhite(),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: nameController,
                      hint: 'ชื่อ - นามสกุล',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: phoneController,
                      hint: 'เบอร์โทรศัพย์',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: emailController,
                      hint: 'อีเมล',
                    ),
                    const SizedBox(
                      height: 32,
                    ),




                    const Icon(Icons.directions_bike),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: boxConstraints.maxWidth * 0.5 - 34,
                          child: WidgetForm(
                            textEditingController: brandController,
                            hint: 'ยี่ห้อ',
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: boxConstraints.maxWidth * 0.5 - 34,
                          child: WidgetForm(
                            textEditingController: numberModelController,
                            hint: 'เลขตัวถังมอเตอร์ไซด์',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: boxConstraints.maxWidth * 0.5 - 34,
                          child: WidgetForm(
                            textEditingController: modelController,
                            hint: 'รุ่น',
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: boxConstraints.maxWidth * 0.5 - 34,
                          child: WidgetForm(
                            textEditingController: colorController,
                            hint: 'สี',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    WidgetForm(
                      textEditingController: nicNameController,
                      hint: 'ตั้งชื่อรถของคุณ',
                    ),
                    const SizedBox(
                      height: 32,
                    ),






                    
                    const Icon(Icons.lock),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(data: 'คำถามเมื่อต้องการรีเซ็ตรหัส'),
                      ],
                    ),
                    Obx(() {
                      return appController.questionModels.isEmpty
                          ? const SizedBox()
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: AppConstant().ballGrey(),
                              child: Column(
                                children: [
                                  DropdownButton(
                                    isExpanded: true,
                                    hint: const WidgetText(
                                        data: 'โปรดเลือกคำถาม'),
                                    value:
                                        appController.chooseQuestionModels.last,
                                    items: appController.questionModels
                                        .map(
                                          (element) => DropdownMenuItem(
                                            child: WidgetText(
                                                data: element.question),
                                            value: element,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      appController.chooseQuestionModels
                                          .add(value);
                                    },
                                  ),
                                  appController.chooseQuestionModels.last ==
                                          null
                                      ? const SizedBox()
                                      : WidgetForm(
                                          textEditingController:
                                              answerController,
                                          hint: 'คำตอบ',
                                        ),
                                ],
                              ),
                            );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(data: 'ตั้งรหัสล๊อคอิน'),
                      ],
                    ),
                    WidgetForm(
                      obcecu: true,
                      textEditingController: passwordController,
                      hint: 'พิมพ์รหัสของคุณ',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetText(data: 'ยืนยันรหัสล๊อคอิน'),
                      ],
                    ),
                    WidgetForm(
                      obcecu: true,
                      hint: 'ยืนยันรหัสของคุณ',
                      textEditingController: rePasswordController,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Obx(() {
                      return CheckboxListTile(
                        value: appController.condition.value,
                        onChanged: (value) {
                          appController.condition.value = value!;
                        },
                        title: const WidgetText(
                            data:
                                'ฉันยอมรับข้อตกลงและยินยอมให้เข้าถึงความเป็นส่วนตัว'),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    }),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetButton(
                          label: 'สมัครบริการ',
                          pressFunc: () {
                            if (nameController.text.isEmpty) {
                              Get.snackbar('Name ?', 'Please Fill Name');
                            } else if (phoneController.text.isEmpty) {
                              Get.snackbar('Phone ?', 'Please Fill Phone');
                            } else if (emailController.text.isEmpty) {
                              Get.snackbar('Email ?', 'Please Fill Email');
                            } else if (brandController.text.isEmpty) {
                              Get.snackbar('Brand ?', 'Please Fill Brand');
                            } else if (numberModelController.text.isEmpty) {
                              Get.snackbar(
                                  'NumberModel ?', 'Please Fill NumberModel');
                            } else if (modelController.text.isEmpty) {
                              Get.snackbar('Model ?', 'Please Fill Model');
                            } else if (colorController.text.isEmpty) {
                              Get.snackbar('Color ?', 'Please Fill Color');
                            } else if (nicNameController.text.isEmpty) {
                              Get.snackbar(
                                  'NiceName ?', 'Please Fill NiceName');
                            } else if (passwordController.text.isEmpty) {
                              Get.snackbar(
                                  'Password ?', 'Please Fill Password');
                            } else if (rePasswordController.text.isEmpty) {
                              Get.snackbar('Repass ?', 'Please Fill Repass');
                            } else if (passwordController.text !=
                                rePasswordController.text) {
                              Get.snackbar('Password Not Math ?',
                                  'กรุณาพิมพ์ passwrod ให้เหมือกัน');
                            } else if (appController
                                    .chooseQuestionModels.last ==
                                null) {
                              Get.snackbar(
                                  'ยังไม่มีคำถาม', 'Please Choose Question');
                            } else if (answerController.text.isEmpty) {
                              Get.snackbar('Answer', 'Please Choose Answer');
                            } else if (!(appController.condition.value)) {
                              Get.snackbar(
                                  'ยังไม่ยอมรับ', 'Please Check Condition');
                            } else {
                              UserModel userModel = UserModel(
                                  nameSur: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  idQuestion: appController
                                      .chooseQuestionModels.last!.id,
                                  answer: answerController.text,
                                  password: passwordController.text);

                              AppService()
                                  .processRegister(userModel: userModel);
                            }
                          },
                          bgColor: AppConstant.greenColor,
                          textStyle: AppConstant().h2White(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  SizedBox head(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth,
      height: boxConstraints.maxHeight * 0.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          topLeftHead(),
          const WidgetImage(path: 'images/battery1.png')
        ],
      ),
    );
  }

  Column topLeftHead() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, left: 16),
          decoration: AppConstant().ballWhite(),
          child: WidgetIconButton(
            iconData: Icons.arrow_back_ios,
            pressFunc: () {
              Get.back();
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, top: 16),
          child: WidgetText(
            data: 'สมัครบัญชี',
            textStyle: AppConstant().h2White(),
          ),
        ),
      ],
    );
  }
}
