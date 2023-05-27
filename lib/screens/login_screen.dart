import 'package:flutter/material.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/auth_controller.dart';
import 'package:test001/screens/forget_password.dart';
import 'package:test001/screens/signup_screen.dart';
import 'package:test001/widget_builder/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              ImageAsset.imageLogo,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: usernameController,
              hintText: "Tên người dùng, email/số di động",
              obscureText: false,
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextField(
                controller: passwordController,
                hintText: "Mật khẩu",
                obscureText: true),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.login(usernameController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
              },
              child: const Text('Bạn quên mật khẩu ư?'),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
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
    );
  }
}
