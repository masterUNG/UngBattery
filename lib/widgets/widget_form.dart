// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.obcecu,
    this.hint,
    this.textEditingController,
  }) : super(key: key);

  final bool? obcecu;
  final String? hint;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        obscureText: obcecu ?? false,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade300)),
            filled: true,
            fillColor: Colors.grey.shade300),
      ),
    );
  }
}
