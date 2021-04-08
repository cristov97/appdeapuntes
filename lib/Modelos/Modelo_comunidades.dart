import 'package:flutter/material.dart';

import 'Modelo_archivos.dart';
import 'Modelo_usuarios.dart';

class Comunidad{
  String nombre;
  String descripcion;
  bool publico;
  Color color;
  String imagen;
  List<Usuario> administradores;
  List<Usuario> miembros;
  List<Seccion> secciones;

  Comunidad({
    this.nombre, 
    this.descripcion,
    this.publico,
    this.color,
    this.imagen,
    this.administradores,
    this.miembros,
    this.secciones
  });

  int get totalUsuarios => administradores.length + miembros.length;
  List<Usuario> get usuarios => administradores + miembros;

  void darAdmin(Usuario usuario){
    administradores.add(usuario);
    miembros.remove(usuario);
    usuario.esAdmin = true;
  }

  void quitarAdmin(Usuario usuario){
    miembros.add(usuario);
    administradores.remove(usuario);
    usuario.esAdmin = false;
  }

  void eliminarUsuario(Usuario usuario){
    administradores.remove(usuario);
    miembros.remove(usuario);
  }
}

class Seccion{
  String titulo;
  List<ModeloArchivo> archivos;
  Seccion({
    this.titulo,
    this.archivos
  });
}