import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = 'forget_password';


   ForgetPasswordScreen({Key? key,}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios_new),
            ),
              SizedBox(height: 20,),
              Text('Tìm tài khoản',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                SizedBox(height: 10,),
                Text('Nhập tên người dùng hoặc email của bạn.',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15
                ),),
              Text('Need more help?',style: TextStyle(
                color: Colors.blue,
                fontSize: 15
              ),),
              SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  label:Text('Tên người dùng hoặc email')
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){}, child: Text('Tìm tài khoản',style: TextStyle(
                  fontSize: 18,
                ),)),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                    setState(() {
                      click = !click;
                    });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: (click == false)? Text('Tìm kiếm bằng email') : Text('Tìm kiếm bằng số di động',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                ),)
          ]
          ),
      ),
    );
  }
}
