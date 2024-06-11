import 'package:get/get.dart';
import 'person.dart';
import 'app_database.dart';

class PersonController extends GetxController {
  var persons = <Person>[].obs;
  late AppDatabase database;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  void initDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    fetchPersons();
  }

  void fetchPersons() async {
    persons.value = await database.personDao.findAllPersons();
  }

  void addPerson(Person person) async {
    await database.personDao.insertPerson(person);
    fetchPersons();
  }
}
