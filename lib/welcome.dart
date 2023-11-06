
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/auth_controller.dart';


class WelcomePage extends StatefulWidget {
  String ? email;
  WelcomePage({Key ?key,required this.email}):super(key:key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.black),),
            Text(widget.email!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey),),
            SizedBox(height: 200,),
            GestureDetector(
              onTap: (){
                AuthController.instance.logOut();
              },
              child: Center(
                child: Text("SignOut",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
