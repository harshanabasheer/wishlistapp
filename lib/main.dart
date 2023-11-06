import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/login.dart';

import 'package:get/get.dart';
Future main()async{//sync fun returns the type future
  WidgetsFlutterBinding.ensureInitialized();//to interact with flutter engin
  //we put await infront of async to make lines waiting for future result
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

