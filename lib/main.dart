import 'package:flutter/material.dart';
import 'package:test001/route.dart';
import 'package:test001/screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    routes: routes,
    home: const InstagramApp(),
  ));
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
