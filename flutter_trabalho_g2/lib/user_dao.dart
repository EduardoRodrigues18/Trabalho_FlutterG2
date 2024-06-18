import 'package:floor/floor.dart';
import 'user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User WHERE username = :username AND password = :password')
  Future<User?> findUser(String username, String password);

  @insert
  Future<void> insertUser(User user);

  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();
}
