import 'package:get/get.dart';
import 'app_database.dart';
import 'user.dart';

class AuthController extends GetxController {
  late AppDatabase database;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  void initDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  Future<bool> login(String username, String password) async {
    final user = await database.userDao.findUser(username, password);
    return user != null;
  }

  Future<void> register(String username, String password) async {
    final user = User(null, username, password);
    await database.userDao.insertUser(user);
  }
}
