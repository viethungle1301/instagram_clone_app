import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test001/auth_controller.dart';
import 'package:test001/route.dart';
import 'package:test001/screens/splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart' show Firebase;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(
      GetMaterialApp(
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
