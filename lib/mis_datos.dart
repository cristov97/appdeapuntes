import 'package:flutter/material.dart';

import 'Modelos/Modelo_archivos.dart';
import 'Modelos/Modelo_comunidades.dart';
import 'Modelos/Modelo_usuarios.dart';

Usuario misDatos = Usuario(
  nick: 'cris',
  correo: 'crisvalenzuela123@gmail.com',
  comunidadesMiembro: [
    Comunidad(
        nombre: 'jhjhjh',
        descripcion: 'mnsdmnfmnsdmnfn knsfkn kaskdkn 123124124129740182094818248102 93893893 93893 93029 4749',
        publico: true,
        color: Colors.purple,
        administradores: [
          Usuario(nick: 'j', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'k', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'l', correo: 'correoMiembro@gmail.com', esAdmin: true),
        ],
        miembros: [
          Usuario(nick: 'a', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'b', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'c', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'd', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'e', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'f', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'g', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'h', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'i', correo: 'correoMiembro@gmail.com'),
        ],
        secciones: [
          Seccion(
            titulo: 'Nada',
            archivos: []
          ),
          Seccion(
            titulo: 'matematicas',
            archivos: [
              ModeloArchivo.mostrar(
                nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
                year: '2018',
                asignatura: 'ECUACIONES DIFERENCIALES',
                detalle: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              ),
              ModeloArchivo.mostrar(
                nombre: 'Prueba 3, 2020',
                year: '2020',
                asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
                detalle: null,
                solucion: true,
                autor: 'UV',
                likes: 555,
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
                likes: 555,
                extension: 'docx'
              ),
              ModeloArchivo.mostrar(
                nombre: '545454544545',
                asignatura: 'INFORMÁTICA I',
                detalle: 'EXPRESIONES REGULARES AASDASDASD',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'ppt'
              ),
              ModeloArchivo.mostrar(
                nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
                year: '2006',
                asignatura: 'INGENIERIA DE LOS MATERIALES',
                likes: 555,
                extension: 'ppt'
              ), 
              ModeloArchivo.mostrar(
                nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
                year: '2021',
                asignatura: 'ECUACIONES DIFERENCIALES',
                solucion: false,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              )
            ]
          )
        ]
      ),
  ],
  comunidadesAdmin: [
    Comunidad(
        nombre: 'El rincon de las matematicas y la tecnologia',
        descripcion: 'mnsdmnfmnsdmnfn knsfkn kaskdkn 123124124129740182094818248102 93893893 93893 93029 4749',
        publico: true,
        color: Colors.purple,
        administradores: [
          Usuario(nick: 'j', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'k', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'l', correo: 'correoMiembro@gmail.com', esAdmin: true),
        ],
        miembros: [
          Usuario(nick: 'a', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'b', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'c', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'd', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'e', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'f', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'g', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'h', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'i', correo: 'correoMiembro@gmail.com'),
        ],
        secciones: [
          Seccion(
            titulo: 'Nada',
            archivos: []
          ),
          Seccion(
            titulo: 'matematicas',
            archivos: [
              ModeloArchivo.mostrar(
                nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
                year: '2018',
                asignatura: 'ECUACIONES DIFERENCIALES',
                detalle: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              ),
              ModeloArchivo.mostrar(
                nombre: 'Prueba 3, 2020',
                year: '2020',
                asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
                detalle: null,
                solucion: true,
                autor: 'UV',
                likes: 555,
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
                likes: 555,
                extension: 'docx'
              ),
              ModeloArchivo.mostrar(
                nombre: '545454544545',
                asignatura: 'INFORMÁTICA I',
                detalle: 'EXPRESIONES REGULARES AASDASDASD',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'ppt'
              ),
              ModeloArchivo.mostrar(
                nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
                year: '2006',
                asignatura: 'INGENIERIA DE LOS MATERIALES',
                likes: 555,
                extension: 'ppt'
              ), 
              ModeloArchivo.mostrar(
                nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
                year: '2021',
                asignatura: 'ECUACIONES DIFERENCIALES',
                solucion: false,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              )
            ]
          )
        ]
      ),

      Comunidad(
        nombre: 'uv',
        descripcion: 'mnsdmnfmnsdmnfn knsfkn kaskdkn 123124124129740182094818248102 93893893 93893 93029 4749',
        publico: true,
        color: Colors.purple,
        administradores: [
          Usuario(nick: 'j', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'k', correo: 'correoMiembro@gmail.com', esAdmin: true),
          Usuario(nick: 'l', correo: 'correoMiembro@gmail.com', esAdmin: true),
        ],
        miembros: [
          Usuario(nick: 'a', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'b', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'c', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'd', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'e', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'f', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'g', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'h', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'i', correo: 'correoMiembro@gmail.com'),
        ],
        secciones: [
          Seccion(
            titulo: 'Nada',
            archivos: []
          ),
          Seccion(
            titulo: 'matematicas',
            archivos: [
              ModeloArchivo.mostrar(
                nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
                year: '2018',
                asignatura: 'ECUACIONES DIFERENCIALES',
                detalle: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              ),
              ModeloArchivo.mostrar(
                nombre: 'Prueba 3, 2020',
                year: '2020',
                asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
                detalle: null,
                solucion: true,
                autor: 'UV',
                likes: 555,
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
                likes: 555,
                extension: 'docx'
              ),
              ModeloArchivo.mostrar(
                nombre: '545454544545',
                asignatura: 'INFORMÁTICA I',
                detalle: 'EXPRESIONES REGULARES AASDASDASD',
                solucion: true,
                autor: 'UV',
                likes: 555,
                extension: 'ppt'
              ),
              ModeloArchivo.mostrar(
                nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
                year: '2006',
                asignatura: 'INGENIERIA DE LOS MATERIALES',
                likes: 555,
                extension: 'ppt'
              ), 
              ModeloArchivo.mostrar(
                nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
                year: '2021',
                asignatura: 'ECUACIONES DIFERENCIALES',
                solucion: false,
                autor: 'UV',
                likes: 555,
                extension: 'pdf'
              )
            ]
          )
        ]
      )

  ]
);