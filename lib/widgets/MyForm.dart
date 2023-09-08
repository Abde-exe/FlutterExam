import 'package:flutter/material.dart';

import '../utils/spaces.dart';
import 'login_textfield.dart';

Widget myForm(context, _formkey, userNameController, passwordController, loginUser) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Form(
        key: _formkey,
        child: Column(
          children: [
            LoginTextField(
              hintText: "Username",
              validator: (value) {
                if (value != null && value.isNotEmpty && value.length < 5) {
                  return "Your username should be more than 5 characters";
                } else if (value != null && value.isEmpty) {
                  return "Please type your username";
                }
                return null;
              },
              controller: userNameController,
            ),
            verticalSpacing(24),
            LoginTextField(
              validator: (value) {
                if (value != null && value.isNotEmpty && value.length < 5) {
                  return "Your password should be more than 5 characters";
                } else if (value != null && value.isEmpty) {
                  return "Please type your password";
                }
                return null;
              },
              hasAsterisks: true,
              controller: passwordController,
              hintText: 'Password',
            ),
          ],
        ),
      ),
      verticalSpacing(24),
      ElevatedButton(
          onPressed: () async {
            await loginUser(context);
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          )),
    ],
  );
}