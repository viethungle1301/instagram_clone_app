import 'package:flutter/material.dart';
import 'package:test001/assets/app_assets.dart';
import 'package:test001/screens/forget_password.dart';
import 'package:test001/screens/home_screen.dart';
import 'package:test001/screens/main_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String routeName = 'login_screen';
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 50,),
              Image.asset(AppAsset.imageLogo,height: 80,width: 80,),
              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tên người dùng, email/ số di động'
                ),),
              SizedBox(height: 15,),
              TextField(
                obscureText: (click == false) ? false : true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Mật khẩu',
                  suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          click = !click;
                        });
                      },
                      child: (click == false) ? Image.asset(AppAsset.iconHide): Icon(Icons.remove_red_eye_outlined))
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(MainScreen.routeName);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  color: Colors.blueAccent,
                  child: Text('Đăng nhập',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
                },
                child: Text('Bạn quên mật khẩu ư?'),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text('Tạo tài khoản mới'),
                ),
              ),
              SizedBox(height: 10,),
              Image.asset(AppAsset.imageLogoMeta,height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}
