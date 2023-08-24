import 'dart:convert';

import 'package:ahorrodigital_mobile/components/loader_component.dart';
import 'package:ahorrodigital_mobile/helpers/constans.dart';
import 'package:ahorrodigital_mobile/models/toke.dart';
import 'package:ahorrodigital_mobile/screen/home_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = 'alejo@yopmail.com';
  String _emailError = '';
  bool _emailShowError = false;

  String _password = '123456';
  String _passwordError = '';
  bool _passwordShowError = false;

  bool _rememberme = true;
  bool _passwordshow = false;

  bool _showLoader = false;
  late Size mediaSizes;
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSizes = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: const AssetImage("assets/loginuno.png"),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(myColor.withOpacity(0.7), BlendMode.dstATop),
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: <Widget>[
            Positioned(top: 40, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
            _showLoader
                ? LoaderComponent(
                    text: 'Por favor espere.. ',
                  )
                : Container(),
          ])),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSizes.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _showLogo(),
          const Text(
            "Ahorro Digital",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSizes.width,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido!",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        _buildGreyText(
            "Ingresa tus datos para acceder a tu portal transaccional"),
        const SizedBox(
          height: 40,
        ),
        _showEmail(),
        const SizedBox(
          height: 20,
        ),
        _showPassword(),
        const SizedBox(
          height: 20,
        ),
        _showRememberme(),
        const SizedBox(
          height: 20,
        ),
        _showButtons(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey, fontSize: 18),
    );
  }

  Widget _showLogo() {
    return const Image(
      image: AssetImage('assets/logonatillera.png'),
      width: 150,
    );
  }

  Widget _showEmail() {
    return Theme(
        data: ThemeData(
          primaryColor: const Color(0XFF229954),
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: Color(0xff229954)),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Ingresa email',
              labelText: 'Email',
              errorText: _emailShowError ? _emailError : null,
              suffixIcon: const Icon(Icons.email),
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
        ));
  }

  Widget _showPassword() {
    return Theme(
        data: ThemeData(
          primaryColor: const Color(0XFF229954),
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: Color(0xff229954)),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            obscureText: !_passwordshow,
            decoration: InputDecoration(
              hintText: 'Ingresa contraseña',
              labelText: 'Contraseña',
              errorText: _passwordShowError ? _passwordError : null,
              suffixIcon: IconButton(
                icon: _passwordshow
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordshow = !_passwordshow;
                  });
                },
              ),
            ),
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
          ),
        ));
  }

  Widget _showRememberme() {
    return CheckboxListTile(
      title: const Text('Recordarme'),
      checkColor: Colors.white,
      activeColor: const Color(0XFF229954),
      value: _rememberme,
      onChanged: (value) {
        setState(() {
          _rememberme = value!;
        });
      },
    );
  }

  Widget _showButtons() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text(
                'Iniciar Sesión',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF229954),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              onPressed: () => _login(),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              child: const Text(
                'Nuevo Usuario',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF16A085),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 15.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
   setState(() {
      _passwordshow = false;
    });

    if (!_validateFields()) {
      return;
    }

    setState(() {
      _showLoader = true;
    });

   
  
     
    Map<String, dynamic> request = {
      'userName': _email,
      'password': _password,
    };

    var url = Uri.parse('${Constans.apiURL}/API/Account/CreateToken');
    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode(request),
    );

    setState(() {
      _showLoader = false;
    });

    if (response.statusCode >= 400) {
      setState(() {
        _passwordShowError = true;
        _passwordError = "Email o contraseña incorrectos";
      });
      return;
    }

    var body = response.body;
   
    var decodedJson = jsonDecode(body);
    var token = Token.fromJson(decodedJson);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  token: token,
                )));
  }
 
  bool _validateFields() {
    bool isvalid = true;

    if (_email.isEmpty) {
      isvalid = false;
      _emailShowError = true;
      _emailError = 'Debes ingresar tu email';
    } else if (!EmailValidator.validate(_email)) {
      isvalid = false;
      _emailShowError = true;
      _emailError = 'Debes ingresar un email válido';
    } else {
      _emailShowError = false;
    }

    if (_password.isEmpty) {
      isvalid = false;
      _passwordShowError = true;
      _passwordError = 'Debes ingresar tu contraseña';
    } else if (_password.length < 6) {
      isvalid = false;
      _passwordShowError = true;
      _passwordError = 'Debes ingresar una contraseña de almenos 6 carácteres';
    } else {
      _passwordShowError = false;
    }

    setState(() {});
    return isvalid;
  }
}
