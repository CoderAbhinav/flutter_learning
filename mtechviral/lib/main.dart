import 'package:flutter/material.dart';
import 'package:mtechviral/pages/home.dart';
import 'package:mtechviral/pages/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routes: {
        "/": (context) => LoginPage(),
        // "/": (context) => Home(),
        "/home": (context) => Home(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
