//import 'package:shared_preferences/shared_preferences.dart';

import 'package:appuntes/Modelos/Modelo_comunidades.dart';

class MisDatos{
  String nick;
  List<Comunidad> comunidades;
  MisDatos(this.comunidades);
}

/*class PreferenciasUsuario{

  PreferenciasUsuario.interna();

  static final PreferenciasUsuario instancia = PreferenciasUsuario.interna();

  factory PreferenciasUsuario(){
    return instancia;
  }

  SharedPreferences prefs;

  void initPrefs() async => prefs = await SharedPreferences.getInstance();
  
}*/