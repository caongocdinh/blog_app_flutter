//widget co the tai su dung

import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsureText = false,
  });

  @override
  Widget build(BuildContext context) {
    //textformfield not textfield vi can xem du lieu co hop le khong
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty){
          return "$hintText không được bỏ trống!";
        }
        return null;
      },
      obscureText: isObsureText,
    );
  }
}
