import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test001/screens/login_screen.dart';
import 'package:test001/screens/main_screen.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  //email, password, name...
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);

  }
  _initialScreen(User? user){
    if(user == null){
      Get.offAll( () => const LoginScreen()
      );
    }else {
      Get.offAll(()=> const MainScreen());
    }
  }

  void register (String email, password)async{
    try{
       await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
        titleText:const Text(
        "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text( e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),)
      );
    }

  }
  void login (String email, password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText:const Text(
            "login failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text( e.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),)
      );
    }

  }
  void logOut()async{
    await auth.signOut();
  }
}