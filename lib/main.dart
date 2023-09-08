import 'package:flutter/material.dart';
import 'package:testapp/pages/LoginPage.dart';
import 'package:testapp/pages/user_information.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: LoginPage(),
      routes: {'/userInfo': (context) => UserInfo()},
    );
  }
}


