import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> connectToDatabase() async {
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    db: 'testdb',
    password: 'secret',
  );

  final connection = await MySqlConnection.connect(settings);
  return connection;
}
