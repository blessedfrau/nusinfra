import 'package:nusantarainfra/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Color color;
  final String imageUrl;
  final Color textColor;
  final Function() onPressed;

  const CustomButton(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.imageUrl = '',
      this.textColor = Colors.white,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageUrl.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset(imageUrl),
              ),
            Text(
              title,
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
