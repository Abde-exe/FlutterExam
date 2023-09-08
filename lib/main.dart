import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/pages/LoginPage.dart';
import 'package:testapp/pages/user_information.dart';

import 'data_base/data_base.dart';


Future<void> main() async {

  runApp( MyApp());
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



