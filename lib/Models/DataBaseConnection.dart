import 'package:postgres/postgres.dart';

final connection = PostgreSQLConnection(
  'host',
  5432,
  'videos',
  username: 'aliya',
  password: '1901',
);

Future<void> connectToDatabase() async {
  await connection.open();
  print('Connected to database');
}
