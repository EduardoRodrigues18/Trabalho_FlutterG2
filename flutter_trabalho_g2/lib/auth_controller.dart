import 'package:get/get.dart';
import 'app_database.dart';
import 'user.dart';

class AuthController extends GetxController {
  late AppDatabase database;

  bool _isDatabaseReady = false;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  void initDatabase() async {
    try {
      print('Initializing database...');
      database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      _isDatabaseReady = true; // Marca o banco de dados como pronto
      print('Database initialized');
    } catch (e) {
      print('Error initializing database: $e');
    }
  }

  Future<bool> login(String username, String password) async {
    await _waitForDatabaseReady(); // Espera até que o banco de dados esteja pronto
    print('Attempting login for username: $username');
    final user = await database.userDao.findUser(username, password);
    print('User found: $user');
    return user != null;
  }

  Future<void> register(String username, String password) async {
    await _waitForDatabaseReady(); // Espera até que o banco de dados esteja pronto
    print('Attempting registration for username: $username');
    final user = User(null, username, password);
    if (_isDatabaseReady) {
      await database.userDao.insertUser(user);
      print('User registered: $username');
    } else {
      print('Database is not ready.');
    }
  }

  Future<void> _waitForDatabaseReady() async {
    // Espera até que o banco de dados esteja pronto
    while (!_isDatabaseReady) {
      await Future.delayed(Duration(milliseconds: 100));
    }
  }
}
