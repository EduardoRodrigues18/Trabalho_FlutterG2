import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'person_controller.dart';
import 'person.dart';

class Home extends StatelessWidget {
  final PersonController personController = Get.put(PersonController());
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                if (name.isNotEmpty) {
                  final person = Person(null, name);
                  personController.addPerson(person);
                  nameController.clear();
                }
              },
              child: Text('Add Person'),
            ),
            Expanded(
              child: Obx(
                () {
                  if (personController.persons.isEmpty) {
                    return Center(child: Text('No persons found.'));
                  } else {
                    return ListView.builder(
                      itemCount: personController.persons.length,
                      itemBuilder: (context, index) {
                        final person = personController.persons[index];
                        return ListTile(
                          title: Text(person.name),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
