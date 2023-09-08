import 'package:flutter/material.dart';

class EditUserModal extends StatefulWidget {
  final String currentUsername;
  final String currentPassword;

  EditUserModal({
    required this.currentUsername,
    required this.currentPassword,
  });

  @override
  _EditUserModalState createState() => _EditUserModalState();
}

class _EditUserModalState extends State<EditUserModal> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current data
    usernameController = TextEditingController(text: widget.currentUsername);
    passwordController = TextEditingController(text: widget.currentPassword);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit User Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            String newUsername = usernameController.text;
            String newPassword = passwordController.text;


            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}