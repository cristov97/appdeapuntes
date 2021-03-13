import 'dart:math';
import 'package:flutter/material.dart';

import 'package:appuntes/HomePage/home_page.dart';
import 'ui_archivos.dart';

class DatosArchivos{
  String nombre;
  String year;
  String asignatura;
  String descripcion;
  String autor;
  String extension;
  bool solucion;
  int like;
  
  DatosArchivos({
    this.nombre,
    this.year, 
    this.asignatura,
    this.descripcion, 
    this.solucion, 
    this.autor, 
    this.like, 
    this.extension
  });
} 

class Archivos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ArchivosState();
}

class _ArchivosState extends State<Archivos>{
  List<DatosArchivos> lista = [
    DatosArchivos(
      nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
      year: '2018',
      asignatura: 'ECUACIONES DIFERENCIALES',
      descripcion: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
      solucion: true,
      autor: 'UV',
      like: Random.secure().nextInt(999),
      extension: 'pdf'
    ),
    DatosArchivos(
      nombre: 'Prueba 3, 2020',
      year: '2020',
      asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
      descripcion: null,
      solucion: true,
      autor: 'UV',
      like: Random.secure().nextInt(999),
      extension: 'pdf'
    ),
    DatosArchivos(
      nombre: 'taller 1, informatica I',
      asignatura: 'INFORMÁTICA I',
      solucion: false,
      autor: 'UV',
      like: 0,
      extension: 'docx'
    ), 
    DatosArchivos(
      nombre: 'Prueba 2 ALGREBA 2021 SEDE SANTIAGO',
      asignatura: 'ÁLGEBRA',
      like: Random.secure().nextInt(999),
      extension: 'docx'
    ),
    DatosArchivos(
      nombre: '545454544545',
      asignatura: 'INFORMÁTICA I',
      descripcion: 'EXPRESIONES REGULARES AASDASDASD',
      solucion: true,
      autor: 'UV',
      like: Random.secure().nextInt(999),
      extension: 'ppt'
    ),
    DatosArchivos(
      nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
      year: '2006',
      asignatura: 'INGENIERIA DE LOS MATERIALES',
      like: Random.secure().nextInt(999),
      extension: 'ppt'
    ), 
    DatosArchivos(
      nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
      year: '2021',
      asignatura: 'ECUACIONES DIFERENCIALES',
      solucion: false,
      autor: 'UV',
      like: Random.secure().nextInt(999),
      extension: 'pdf'
    ),  
  ];

  @override
  Widget build(BuildContext context) {
  
    final double _spaceEnd = (MediaQuery.of(context).size.height)/9;

    return RefreshIndicator(
      onRefresh: () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, a, b) => MyHomePage()
        )
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: _spaceEnd),
        itemCount: lista.length,
        itemBuilder: (context, i){
          return UiArchivo(
            nombre       : lista[i].nombre,
            year         : lista[i].year, 
            asignatura   : lista[i].asignatura, 
            detalle      : lista[i].descripcion, 
            solucion     : lista[i].solucion, 
            autor        : lista[i].autor,
            likes        : lista[i].like,
            extension    : lista[i].extension
          );
        }
      )
    );
  }
}




