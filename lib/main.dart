import 'package:flutter/material.dart';
import 'package:login_regestration/shared/constants.dart';

import 'modules/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: defaultPadding * 1.2,
            horizontal: defaultPadding,
          ),
        ),
      ),
      home: AuthScreen(),
    );
  }
}
