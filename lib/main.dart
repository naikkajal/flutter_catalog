import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
// ignore: unused_import
import 'pages/LoginPage.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        "/home" :(context) => HomePage(),
        "/login" :(context) => LoginPage()
      },
    );
  }
}
