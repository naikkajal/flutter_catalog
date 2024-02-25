import 'package:flutter/material.dart';
import 'package:flutter_catalog/HomePage.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    
    );
  }
}
