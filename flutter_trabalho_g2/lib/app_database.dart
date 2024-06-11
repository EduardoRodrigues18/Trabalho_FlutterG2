import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'person.dart';
import 'person_dao.dart';
import 'user.dart';
import 'user_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Person, User])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
  UserDao get userDao;
}
