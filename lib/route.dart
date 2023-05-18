import 'package:flutter/material.dart';
import 'package:test001/screens/forget_password.dart';
import 'package:test001/screens/login_screen.dart';
import 'package:test001/screens/main_screen.dart';
import 'package:test001/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
};
