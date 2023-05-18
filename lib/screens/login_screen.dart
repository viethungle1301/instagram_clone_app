import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/screens/forget_password.dart';
import 'package:test001/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                ImageAsset.imageLogo,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 50,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tên người dùng, email/ số di động'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: (click == false) ? false : true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Mật khẩu',
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            click = !click;
                          });
                        },
                        child: (click == false)
                            ? Image.asset(ImageAsset.iconHide)
                            : const Icon(Icons.remove_red_eye_outlined))),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(MainScreen.routeName);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: const Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ForgetPasswordScreen.routeName);
                },
                child: const Text('Bạn quên mật khẩu ư?'),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('Tạo tài khoản mới'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                ImageAsset.imageLogoMeta,
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
