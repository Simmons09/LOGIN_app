import 'package:delivery/src/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = RegisterController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: _circleRegister(),
            left: -90,
            top: -100,
          ),
          Positioned(
            child: _textRegister(),
            top: 50,
            left: 30,
          ),
          Positioned(
            child: _iconBack(),
            top: 35,
            left: 2,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 128),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _imageUser(),
                  const SizedBox(
                    height: 15,
                  ),
                  _textFieldEmail(),
                  _textFieldName(),
                  _textFieldLastName(),
                  _textFieldPhone(),
                  _textFieldPassword(),
                  _textFieldConfirmPassword(),
                  _buttonRegister()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: ElevatedButton(
        onPressed: _con.register,
        style: ElevatedButton.styleFrom(
            backgroundColor: Mycolors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: const Text('REGISTRATE'),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPassController,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        obscureText: true,
        controller: _con.passController,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.lock,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _con.phoneController,
        decoration: InputDecoration(
            hintText: 'Telefono',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.phone,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.lastNameController,
        decoration: InputDecoration(
            hintText: 'Apellido',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.person_outline,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
            hintText: 'Nombre',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.person,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'Correo Electronico',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.email,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _iconBack() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }

  Widget _circleRegister() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Mycolors.primaryColor),
    );
  }

  Widget _textRegister() {
    return const Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'NimbusSans'),
    );
  }
}
