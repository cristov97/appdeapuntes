import 'package:flutter/material.dart';

import 'Modelo_archivos.dart';

class Comunidad{
  String nombre;
  String descripcion;
  bool publico;
  Color color;
  Image imagen;
  List<Usuario> usuarios;
  List<Seccion> secciones;

  Comunidad({
    this.nombre, 
    this.descripcion,
    this.publico,
    this.color,
    this.imagen,
    this.usuarios,
    this.secciones
  });
}

class Usuario{
  String nick;
  String correo;
  Usuario(this.nick);
}

class Seccion{
  String titulo;
  List<ModeloArchivo> archivos;
  Seccion({
    this.titulo,
    this.archivos
  });
}