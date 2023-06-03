import 'package:delivery/src/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            child: _circleLogin(),
            top: -100,
            left: -100,
          ),
          Positioned(
            child: _textLogin(),
            top: 52,
            left: 26,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                _lottieAnimation(),
                _textFieldEmail(),
                _textFieldPassword(),
                _buttonLogin(),
                _textDontHaveAccount(),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
      decoration: BoxDecoration(
          color: Mycolors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo Electrónico',
            hintStyle: TextStyle(color: Mycolors.primaryColorDark),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.email,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
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
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(
              Icons.email,
              color: Mycolors.primaryColor,
            )),
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 30),
      child: Image.asset(
        'assets/img/delivery.png',
        height: 200,
        width: 200,
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(top: 150, bottom: 30),
      child: Lottie.asset('assets/json/delivery.json',
          width: 350, height: 200, fit: BoxFit.fill),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta',
          style: TextStyle(color: Mycolors.primaryColor),
        ),
        SizedBox(
          width: 9,
        ),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Mycolors.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: ElevatedButton(
        onPressed: _con.login,
        child: Text('INGRESAR'),
        style: ElevatedButton.styleFrom(
          primary: Mycolors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Mycolors.primaryColor,
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      'Login',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'NimbusSans'),
    );
  }
}
