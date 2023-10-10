import 'package:battery/utility/app_service.dart';
import 'package:battery/widgets/widget_button.dart';
import 'package:battery/widgets/widget_form.dart';
import 'package:battery/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class AddMotocycle extends StatefulWidget {
  const AddMotocycle({super.key});

  @override
  State<AddMotocycle> createState() => _AddMotocycleState();
}

class _AddMotocycleState extends State<AddMotocycle> {
  TextEditingController brandController = TextEditingController();

  TextEditingController numberModelController = TextEditingController();

  TextEditingController modelController = TextEditingController();

  TextEditingController colorController = TextEditingController();

  TextEditingController nicNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'เพิ่มรถมอเตอร์ไซด์'),
      ),
      body: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
        return Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            children: [
              const Icon(Icons.directions_bike),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: boxConstraints.maxWidth * 0.5 - 34,
                    child: WidgetForm(
                      textEditingController: brandController,
                      hint: 'ยี่ห้อ',
                      validateFunc: (p0) {
                        if (p0?.isEmpty ?? true) {
                          return 'กรอก ยี่ห้อ ด้วยคะ';
                        } else {
                          return null;
                        }
                      },
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
                      validateFunc: (p0) {
                        if (p0?.isEmpty ?? true) {
                          return 'กรอก เลขตัวถัง';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: boxConstraints.maxWidth * 0.5 - 34,
                    child: WidgetForm(
                      textEditingController: modelController,
                      hint: 'รุ่น',
                      validateFunc: (p0) {
                        if (p0?.isEmpty ?? true) {
                          return 'กรอก รุ่น';
                        } else {
                          return null;
                        }
                      },
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
                      validateFunc: (p0) {
                        if (p0?.isEmpty ?? true) {
                          return 'กรอก สี';
                        } else {
                          return null;
                        }
                      },
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
                validateFunc: (p0) {
                  if (p0?.isEmpty ?? true) {
                    return 'กรอก ตั้งชื่อรถของคุณ';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              WidgetButton(
                label: 'เพิ่มรถมอเตอร์ไซด์',
                pressFunc: () {
                  if (formKey.currentState?.validate() ?? false) {
                    print('validate true');

                    AppService().processAddMotocycle(
                      brand: brandController.text,
                      numberModel: numberModelController.text,
                      model: modelController.text,
                      color: colorController.text,
                      nicName: nicNameController.text,
                    );
                  }
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
