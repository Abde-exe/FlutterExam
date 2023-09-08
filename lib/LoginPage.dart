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
      Navigator.pushReplacementNamed(context, '/chat', arguments:'${userNameController.text}');
      print('Validated');
    } else {
      print('Not Validated');
    }
  }
   final userNameController = TextEditingController();
   final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Lets log you in!')),
            Image.network("https://pbs.twimg.com/profile_images/1697614573187072000/mjFRYv9z_400x400.jpg", height: 200,),
            myForm(context, _formkey, userNameController, passwordController, loginUser)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {print('Clicked');},
          child: Icon(Icons.add),
        )
    );
  }
}
