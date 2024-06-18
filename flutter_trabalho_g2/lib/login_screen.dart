import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'register_screen.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print('Login button pressed');
                final username = usernameController.text;
                final password = passwordController.text;
                print('Username: $username, Password: $password');
                final success = await authController.login(username, password);
                print('Login success: $success');
                if (success) {
                  Get.off(Home());
                  Get.snackbar('Success', 'Login successful');
                } else {
                  Get.snackbar('Error', 'Invalid username or password',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(RegisterScreen());
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
