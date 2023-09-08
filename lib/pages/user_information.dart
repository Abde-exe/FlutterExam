import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../data_base/data_base.dart';
import '../model/User.dart';
import '../repository/user_repo.dart';
import '../widgets/edit_dialog.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {





  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String username = args['username'];
    final String password = args['password'];
    //final username = "a modifier";
    //final password = "a modifier";

    return  Scaffold(
      appBar: AppBar(
        title: Text('UserInfo'),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Bonjour $username',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username : $username',
                  ),
                  enabled: false,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'User ID',
                  ),
                  enabled: false,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Password : $password',
                  ),
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                Row(
                  children: [
                    ElevatedButton(onPressed: () async {
                      final connection = await connectToDatabase();
                      final userRepository = UserRepository(connection);

                      final newUser = User( userName: username, userPassword: password);
                      final userId = await userRepository.insertUser(newUser);

                      print('Inserted user with ID: $userId');
                      /*
                      final userFromDb = await userRepository.getUserById(userId!);
                      if (userFromDb != null) {
                        print('User added to database: ${userFromDb.userName}, ID: ${userFromDb.id}');
                      } else {
                        print('User not found in the database.');
                      }*/

                      await connection.close();


                    }, child: Text('Enregister')),
                    ElevatedButton(onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context) => EditUserModal(
                          currentUsername: '$username',
                          currentPassword: '$password',
                        ),
                      );
                    }, child: Text('Modifier')),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Logout'))
              ],
            ),
          ),
        ),
    );
  }
}
