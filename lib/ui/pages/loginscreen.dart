import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantarainfra/cubit/auth_cubit.dart';
import 'package:nusantarainfra/shared/theme.dart';
import 'package:nusantarainfra/ui/pages/homescreen.dart';
import 'package:nusantarainfra/ui/widget/custom_button.dart';
import 'package:nusantarainfra/ui/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        margin: const EdgeInsets.only(top: 46),
        width: 140,
        height: 140,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/Logo Mark.png',
            ),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          hintText: 'Email',
          controller: emailController,
        );
      }

      Widget loginInput() {
        return CustomTextFormField(
          hintText: 'Password',
          controller: passwordController,
          obscureText: true,
          icon: 'assets/password-hide.png',
        );
      }

      Widget submitLogin() {
        return BlocConsumer<AuthCubit, AuthState>(
          builder: (contex, state) {
            if (state is AuthInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              color: redColor,
              title: 'Login',
              onPressed: () {
                context.read<AuthCubit>().authenticate(
                      emailController.text,
                      passwordController.text,
                    );
              },
            );
          },
          listener: (context, state) {
            if (state is AuthAuthenticationSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => AuthCubit(),
                          child: HomeScreen(
                            response: state.response,
                          ),
                        )),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: redColor,
                  content: Text(state.message),
                ),
              );
            }
          },
        );
      }

      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: loginMarginH,
        ),
        child: Column(
          children: [
            emailInput(),
            loginInput(),
            submitLogin(),
          ],
        ),
      );
    }

    Widget bottomSection() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: loginMarginH,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: loginMarginH,
              ),
              child: Text(
                'Forgot Password ?',
                style: blackTextStyle.copyWith(
                  color: blueColor,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Divider(
                      color: blueColor,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: blackTextStyle.copyWith(
                        color: blueColor,
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: blueColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: CustomButton(
                imageUrl: 'assets/facebook.png',
                color: blueColor,
                title: 'Log in with facebook ',
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: CustomButton(
                imageUrl: 'assets/google.png',
                color: whiteColor,
                title: 'Log in with Google',
                textColor: blackColor,
                onPressed: () {},
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
            child: Center(
          child: ListView(
            children: [
              logo(),
              inputSection(),
              bottomSection(),
            ],
          ),
        )));
  }
}
