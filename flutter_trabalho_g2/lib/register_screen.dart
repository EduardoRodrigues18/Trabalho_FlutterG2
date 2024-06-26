import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
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
                print('Register button pressed');
                final username = usernameController.text;
                final password = passwordController.text;
                print('Username: $username, Password: $password');
                await authController.register(username, password);
                print('User registered');
                Get.snackbar('Success', 'Registration successful',
                    snackPosition: SnackPosition.BOTTOM);
                Get.off(LoginScreen());
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
