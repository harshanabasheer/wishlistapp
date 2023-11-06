import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/login.dart';
import 'package:wishlistapp/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{//should be resposible for navigating different pages
  static AuthController instance =Get.find();//would able to acces all the properties from any page
  late Rx<User?> _user;//(reactive extensions)these observablecan be listened to for changes,and thenever their values
// changes they automatilly upadate any UI components that are bound to themit inculde our user info
FirebaseAuth auth=FirebaseAuth.instance;//authentication

@override
  void onReady() {
    super.onReady();
    _user= Rx<User?>(auth.currentUser);//cast to getx so we user Rx<user?>
  //when user is alive the user itself notify because of bindstream fn
  _user.bindStream(auth.userChanges());//to track user things
  //it will be listening all the time changes
  ever(_user,_initialScreen);//ever fn take a listener and call back fn
  }
  _initialScreen(User ?user){
  if(user==null){
    print("login page");
    Get.offAll(()=>Login());
  }else{
    Get.offAll(()=>WelcomePage(email: user.email));
  }
  }
  void register(String email,password)async{
  try{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }catch(e){
    Get.snackbar("About user", "User message",
    backgroundColor: Colors.redAccent,snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Account creation failed"),
    messageText: Text(e.toString()));
  }
  }
  void login(String email,password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About login", "Login message",
          backgroundColor: Colors.redAccent,snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed"),
          messageText: Text(e.toString()));
    }
  }
  void logOut()async{
  await auth.signOut();
  }


}