import 'package:flutter/material.dart';

import 'Ajustes/ajustes_page.dart';
import 'HomePage/home_page.dart';
import 'HomePage/perfil_page.dart';
import 'Upload/upload_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Appuntes',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login'  : (context) => Login(),
        'home'   : (context) => MyHomePage(),
        'perfil' : (context) => Perfil(),
        'ajustes': (context) => Ajustes(),
        'upload' : (context) => UploadPage()
      },
    );
  }
}

class UserDatos{
  static Set<String> listLikes;
}
