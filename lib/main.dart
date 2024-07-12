import 'package:flutter/material.dart';
import 'scene/splash_screen.dart';

void main() {
  runApp(const DealsDrayApp());
}

class DealsDrayApp extends StatelessWidget{
  const DealsDrayApp({super.key});

  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}