import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayScreen();
  }

  void delayScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 350,
          ),
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Image.asset(ImageAsset.imageLogo),
            ),
          ),
          const Spacer(),
          const Text('from'),
          SizedBox(
            height: 30,
            width: 150,
            child: Image.asset(
              ImageAsset.imageLogoMeta,
            ),
          )
        ],
      ),
    );
  }
}
