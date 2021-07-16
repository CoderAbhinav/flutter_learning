import 'package:flutter/material.dart';
import 'package:mtechviral/pages/home.dart';
import 'package:mtechviral/pages/loginPage.dart';
import 'package:mtechviral/utils/routes.dart';
import 'package:mtechviral/utils/myTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: myTheme.lighttheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        // MyRoutes.: (context) => LoginPage(),
        // "/": (context) => Home(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.login: (context) => LoginPage(),
      },
    );
  }
}
