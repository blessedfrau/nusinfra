import 'package:flutter/material.dart';
import 'package:nusantarainfra/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String icon;

  const CustomTextFormField(
      {Key? key,
      required this.hintText,
      this.obscureText = false,
      required this.controller,
      this.icon = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: blackColor,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                suffixIcon:
                    (icon.isNotEmpty) ? Image.asset(icon) : const SizedBox()),
          ),
        ],
      ),
    );
  }
}
