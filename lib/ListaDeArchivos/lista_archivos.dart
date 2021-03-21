import 'dart:math';

import 'package:flutter/material.dart';

import 'package:appuntes/Otros/Modelo_archivos.dart';
import 'package:appuntes/HomePage/home_page.dart';
import 'ui_archivos.dart';

class Archivos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ArchivosState();
}

class _ArchivosState extends State<Archivos>{
  List<ModeloArchivo> lista = [
    ModeloArchivo.mostrar(
      nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
      year: '2018',
      asignatura: 'ECUACIONES DIFERENCIALES',
      detalle: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
      solucion: true,
      autor: 'UV',
      likes: Random.secure().nextInt(999),
      extension: 'pdf'
    ),
    ModeloArchivo.mostrar(
      nombre: 'Prueba 3, 2020',
      year: '2020',
      asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
      detalle: null,
      solucion: true,
      autor: 'UV',
      likes: Random.secure().nextInt(999),
      extension: 'pdf'
    ),
    ModeloArchivo.mostrar(
      nombre: 'taller 1, informatica I',
      asignatura: 'INFORMÁTICA I',
      solucion: false,
      autor: 'UV',
      likes: 0,
      extension: 'docx'
    ), 
    ModeloArchivo.mostrar(
      nombre: 'Prueba 2 ALGREBA 2021 SEDE SANTIAGO',
      asignatura: 'ÁLGEBRA',
      likes: Random.secure().nextInt(999),
      extension: 'docx'
    ),
    ModeloArchivo.mostrar(
      nombre: '545454544545',
      asignatura: 'INFORMÁTICA I',
      detalle: 'EXPRESIONES REGULARES AASDASDASD',
      solucion: true,
      autor: 'UV',
      likes: Random.secure().nextInt(999),
      extension: 'ppt'
    ),
    ModeloArchivo.mostrar(
      nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
      year: '2006',
      asignatura: 'INGENIERIA DE LOS MATERIALES',
      likes: Random.secure().nextInt(999),
      extension: 'ppt'
    ), 
    ModeloArchivo.mostrar(
      nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
      year: '2021',
      asignatura: 'ECUACIONES DIFERENCIALES',
      solucion: false,
      autor: 'UV',
      likes: Random.secure().nextInt(999),
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
            detalle      : lista[i].detalle, 
            solucion     : lista[i].solucion, 
            autor        : lista[i].autor,
            likes        : lista[i].likes,
            extension    : lista[i].extension
          );
        }
      )
    );
  }
}




