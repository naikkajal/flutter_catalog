import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/LoginPage.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
