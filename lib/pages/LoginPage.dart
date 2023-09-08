import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/widgets/MyForm.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  final _formkey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      Navigator.pushNamed(
        context,
        '/userInfo',
        arguments: {
          'username': userNameController.text,
          'password': passwordController.text,
        },
      );

      print('Success');
    } else {
      print('Error');
    }
  }
   final userNameController = TextEditingController();
   final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Login Page")
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Lets log you in!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
            Image.asset("image.jpg", height: 200,),
            myForm(context, _formkey, userNameController, passwordController, loginUser)
          ],
        ),

    );
  }
}
