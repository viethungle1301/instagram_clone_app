import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test001/assets/asset_image.dart';
import 'package:test001/auth_controller.dart';
import 'package:test001/widget_builder/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = 'signup_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:const  EdgeInsets.only(top: 20,left: 10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:const  Icon(Icons.arrow_back),
            ),
          ),
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
              AuthController.instance.register(usernameController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueAccent),
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=> Get.back(),
                text: "Have an account?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500]
                )
              )),
          const Spacer(),

          Image.asset(
            ImageAsset.imageLogoMeta,
            height: 30,
          )
        ],
      ),
    );
  }
}
