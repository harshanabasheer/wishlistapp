
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/List.dart';
import 'package:wishlistapp/auth_controller.dart';
import 'package:wishlistapp/signup.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email=TextEditingController();
  var password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
                  Text("SignIn to your account",style: TextStyle(fontSize: 20,color: Colors.grey),),
                  SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(blurRadius: 10,spreadRadius: 7,offset: Offset(1,1),color: Colors.grey.withOpacity(0.2))]
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(hintText: "Email",
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white,width: 1.0))),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(blurRadius: 10,
                    spreadRadius: 7,
                    offset: Offset(1,1),
                    color: Colors.grey.withOpacity(0.2))]),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0
                          )
                        ),),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Text("Forgot your Password?",style: TextStyle(fontSize: 20,color: Colors.grey),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 70,),
            GestureDetector(
              onTap: (){
                AuthController.instance.login(email.text.trim(), password.text.trim());
              },
              child: Center(
                child: Text("SignIn",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            RichText(text: TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(color: Colors.grey,fontSize: 20),
              children:[
                TextSpan(text: "Create",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUp())
                )
              ]
            ))
          ],
        ),
      ),

    );
  }
}
