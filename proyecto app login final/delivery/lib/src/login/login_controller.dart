import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passController.text.trim();
    print('email $email');
    print('password $password');
  }
}
