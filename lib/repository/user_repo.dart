import 'package:mysql1/mysql1.dart';

import '../model/User.dart';

class UserRepository {
  final MySqlConnection _connection;

  UserRepository(this._connection);

  Future<int?> insertUser(User user) async {
    final result = await _connection.query(
      'INSERT INTO users (name, password) VALUES (?, ?)',
      [user.userName, user.userPassword],
    );

    return result.insertId;
  }
  //getuser by id
  Future<User?> getUserById(int userId) async {
    final result = await _connection.query(
      'SELECT * FROM users WHERE id = ?',
      [userId],
    );

    if (result.isEmpty) {
      return null;
    }

    return User.fromMap(result.first.fields);
  }

}
