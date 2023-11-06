
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/auth_controller.dart';

class SignUp extends StatefulWidget {
  SignUp({Key ?key}):super(key:key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    var email=TextEditingController();
    var password=TextEditingController();

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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(blurRadius: 10,spreadRadius: 7,offset: Offset(1,1),color: Colors.grey.withOpacity(0.2))]
                    ),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(hintText: "Email",
                          prefixIcon: Icon(Icons.email,color: Colors.deepOrangeAccent,),
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
                        prefixIcon: Icon(Icons.lock,color: Colors.deepOrangeAccent,),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0
                            )
                        ),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70,),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(email.text.trim(), password.text.trim());

              },
              child: Center(
                child: Text("SignIn",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            RichText(text: TextSpan(
                text: "Already have an account",
                style: TextStyle(color: Colors.grey,fontSize: 20),
                children:[
                  TextSpan(text: "SignIn",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  )
                ]
            ))
          ],
        ),
      ),

    );
  }
}
