import 'package:ahorrodigital_mobile/models/toke.dart';
import 'package:ahorrodigital_mobile/screen/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Token token;
  HomeScreen({required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ahorro Digital'),
      ),
      body: _getbody(),
      drawer: _getMechanicMenu(),
    );
  }

  Widget _getbody() {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Center(
        child: Text(
          'Bienvenid@! ${widget.token.user.fullName}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getMechanicMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
         const DrawerHeader(
            child: Image(
              image: AssetImage('assets/logonatillera.png'),
              )
              ),
              ListTile(
                leading:const Icon(Icons.local_atm),
                title:const Text('Cuentas Bancarias'),
                onTap: (){},
              ),
              ListTile(
                leading:const Icon(Icons.badge),
                title:const Text('Tipos Documentos'),
                onTap: (){},
              ),
              ListTile(
                leading:const Icon(Icons.savings),
                title:const Text('Tipos Ahorros'),
                onTap: (){},
              ),
              ListTile(
                leading:const Icon(Icons.credit_card),
                title:const Text('Tipos Prestamos'),
                onTap: (){},
              ),ListTile(
                leading:const Icon(Icons.group),
                title:const Text('Usuarios'),
                onTap: (){},
              ),
              Divider(
                color: Colors.black,
                height: 2,),

              ListTile(
                leading:const Icon(Icons.person),
                title:const Text('Editar Perfil'),
                onTap: (){},
              ),ListTile(
                leading:const Icon(Icons.logout),
                title:const Text('Cerrar Sesión'),
                onTap: (){
                   Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                 
                )));
  }
 
                
              )
        ],
      ),
    );
  }
}
