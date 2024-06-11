import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int? id; // Permitir que o id seja null para autoincrement

  final String name;

  Person(this.id, this.name);
}
