import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:delivery/src/provider/user_provider.dart';
import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  UserProvider userProvider = new UserProvider();

  Future? init(BuildContext context) {
    this.context = context;
    userProvider.init(context);
  }

  void register() async {
    String email = emailController.text.trim().toLowerCase();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String pass = passController.text;
    String confirmPass = confirmPassController.text;

    User user = User(
        email: email,
        password: pass,
        name: name,
        lastname: lastName,
        phone: phone);
    ResponseApi responseApi = await userProvider.create(user);
    print('Respuesta ${responseApi.toJson()}');
  }
}
