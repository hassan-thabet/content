import 'package:content/bloc/home/home_bloc.dart';
import 'package:content/views/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'bloc/login/login_bloc.dart';
import 'bloc/register/register_bloc.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Content - Download & Read Free Books',
            theme: ThemeData(
              platform: TargetPlatform.iOS,
              fontFamily: 'Georama',
              scaffoldBackgroundColor: BACKGROUND_COLOR,
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: GRADIENT_END,
                  ),
            ),
            home: Splash(),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
