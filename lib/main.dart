import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusantarainfra/service_locator.dart';

import 'cubit/auth_cubit.dart';
import 'ui/pages/loginscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init().whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => LoginScreen(),
          },
        ));
  }
}
