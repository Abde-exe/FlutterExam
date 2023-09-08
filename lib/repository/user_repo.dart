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

  //get all users
  Future<List<User>> getAllUsers() async {
    final result = await _connection.query(
      'SELECT * FROM users',
    );

    return result.map((e) => User.fromMap(e.fields)).toList();
  }

  //update user
  Future<int?> updateUser(User user) async {
    final result = await _connection.query(
      'UPDATE users SET name = ?, password = ? WHERE id = ?',
      [user.userName, user.userPassword, user.id],
    );

    return result.affectedRows;
  }
  //delete user
  Future<int?> deleteUser(int userId) async {
    final result = await _connection.query(
      'DELETE FROM users WHERE id = ?',
      [userId],
    );

    return result.affectedRows;
  }

}
