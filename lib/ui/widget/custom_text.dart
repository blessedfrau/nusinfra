import 'package:flutter/material.dart';
import 'package:nusantarainfra/shared/theme.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  const CustomText({Key? key, required this.title, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: blackTextStyle.copyWith(
        color: color,
      ),
    );
  }
}
