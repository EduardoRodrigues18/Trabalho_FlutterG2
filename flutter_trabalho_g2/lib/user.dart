import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int? id; // Permitimos que o id seja null para autoincrement
  final String username;
  final String password;

  User(this.id, this.username, this.password);
}
