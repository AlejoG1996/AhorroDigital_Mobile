import 'package:ahorrodigital_mobile/screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ahorro Digital App',
       theme:  ThemeData(
       primarySwatch: Colors.green,
        primaryColor:const  Color(0xff229954),
        
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}