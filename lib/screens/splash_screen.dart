import 'package:flutter/material.dart';
import 'package:test001/assets/app_assets.dart';
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
    // TODO: implement initState
    super.initState();
    delayScreen();
  }
  void delayScreen() async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 350,),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Image.asset(AppAsset.imageLogo),
              ),
            ),
            Spacer(),
            Text('from'),
            Container(
              height: 30,
              width: 150,
              child: Image.asset(AppAsset.imageLogoMeta,),
            )
          ],
        ),
      ),
    );
  }
}
