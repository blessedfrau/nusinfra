import 'package:flutter/material.dart';
import 'package:nusantarainfra/shared/theme.dart';

class CustomCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;
  final Color color;

  const CustomCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imgUrl,
                color: color,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  color: color,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
