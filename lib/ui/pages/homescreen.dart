import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantarainfra/cubit/auth_cubit.dart';
import 'package:nusantarainfra/model/auth_response.dart';
import 'package:nusantarainfra/shared/theme.dart';
import 'package:nusantarainfra/ui/widget/custom_card.dart';
import 'package:nusantarainfra/ui/widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  final AuthResponse response;
  const HomeScreen({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState(response);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  AuthResponse response;
  _HomeScreenState(this.response);
  Widget photoProfileSection() {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 26),
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 140,
                      height: 120,
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.brown.shade800,
                            backgroundImage: NetworkImage(response.user.avatar),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 100,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/changebutton.png',
                                width: 40,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Angelica Jackson',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        )),
                    Text('Analyst',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: thick,
                        )),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      clipBehavior: Clip.none,
                      child: Text(
                        'Change Profile',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: light,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Widget strongSide() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Strong side',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                title: 'Analytics',
                color: greenColor,
              ),
              CustomText(
                title: 'Perfectionism',
                color: greenColor,
              ),
              CustomText(
                title: 'Analytics',
                color: greenColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget weakSide() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weak side',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                title: 'Perfectionism',
                color: redColor,
              ),
              CustomText(
                title: 'Analytics',
                color: redColor,
              ),
              CustomText(
                title: 'Analytics',
                color: whiteColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget myReport() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Report',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: medium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCard(
                imgUrl: 'assets/user.png',
                title: 'Astro-psychological\nreport',
                subtitle: 'Some short description\nof this type of report.',
                color: blackColor,
              ),
              CustomCard(
                imgUrl: 'assets/calendar.png',
                title: 'Monthly prediction\nreport',
                subtitle: 'Some short description\nof this type of report.',
                color: greenColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCard(
                imgUrl: 'assets/check-square.png',
                title: 'Daily Prediction',
                subtitle: 'Some short description\nof this type of report.',
                color: redColor,
              ),
              CustomCard(
                imgUrl: 'assets/heart.png',
                title: 'Love report',
                subtitle: 'Some short description\nof this type of report.',
                color: pinkColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'Profile',
          style: blackTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0x9C1F1449),
          ), // set your color here
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const ImageIcon(
              AssetImage("assets/settings.png"),
              color: Color(0x9C1F1449),
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: homePaddingH,
          ),
          shrinkWrap: true,
          children: [
            photoProfileSection(),
            strongSide(),
            weakSide(),
            myReport()
          ],
        ),
      ),
    );
  }
}
