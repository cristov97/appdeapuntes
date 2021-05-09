import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_usuarios.dart';
import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import 'package:appuntes/Modelos/Modelo_notificacion.dart';
import 'package:appuntes/Widgets/compartirRecursosFormWidget.dart';
import '../../mis_datos.dart';
import 'comunidad_page.dart';
import 'tarjeta_comunidad.dart';


class Comunidades extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    List<Comunidad> comunidades = [
      Comunidad(
        nombre: 'UV',
        descripcion: 'mns dmnfmns dmnfn knsfkn kaskdkn ',
        publico: false,
        color: Colors.green,
        administradores: [
          Usuario(nick: 'je', correo: 'correoMiembro@gmail.com'),
        ],
        miembros: [
          Usuario(nick: 'a', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'b', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'c', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'd', correo: 'correoMiembro@gmail.com'),
          Usuario(nick: 'e', correo: 'correoMiembro@gmail.com'),
        ],
        secciones: [
          Seccion(
            titulo: 'ciencia',
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
                likes: 0,
                extension: 'pdf'
              ) 
            ]
          ),
          Seccion(titulo: 'g', archivos: []),
           Seccion(titulo: 'g', archivos: []),
            Seccion(titulo: 'g', archivos: []),
             Seccion(titulo: 'g', archivos: []),
              Seccion(titulo: 'g', archivos: []),
               Seccion(titulo: 'g', archivos: []),
                Seccion(titulo: 'g', archivos: []),
                 Seccion(titulo: 'g', archivos: []),
                  Seccion(titulo: 'g', archivos: []),
                   Seccion(titulo: 'g', archivos: []),
                    Seccion(titulo: 'g', archivos: []),
                     Seccion(titulo: 'g', archivos: []),
                      Seccion(titulo: 'g', archivos: []),
                       Seccion(titulo: 'g', archivos: []),
        ]
      ),
      Comunidad(
        nombre: 'El rincon de las matematicas y la tecnologia',
        descripcion: 'mnsdmnfmnsdmnfn knsfkn kaskdkn 123124124129740182094818248102 93893893 93893 93029 4749',
        publico: true,
        color: Colors.purple,
        administradores: [
          Usuario(nick: 'je', correo: 'correoMiembro@gmail.com'),
        ],
        miembros:[
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
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: comunidades.length,
        itemBuilder: (context, i) => UiComunidad(
          comunidad: comunidades[i],
          onTap: comunidades[i].publico == false && !misDatos.comunidades.contains(comunidades[i])
          ? () => enviarSolicitud(context, comunidades[i]) : null
        )
      )
    );
  }

  void enviarSolicitud(BuildContext context, Comunidad comunidad){
    showDialog(
      context: context,
      builder: (context) => CompartirRecurso(
        comunidad: comunidad,
        tituloDialogo: 'Solicitud de acceso',
        notificacion: Notificar.solicitud
      )
    );
  }
}

class UiComunidad extends StatelessWidget{

  final Comunidad comunidad;
  final Function onTap;

  UiComunidad({
    this.comunidad,
    this.onTap
  });

  Widget avatar(Color text, Color background, double lado){
    return Container(
      width: lado, height: lado,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: comunidad.imagen != null? comunidad.imagen : Center(
        child: Text(
          comunidad.nombre.substring(0,1),
          style: TextStyle(color: text, fontWeight: FontWeight.bold, fontSize: 25)
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: avatar(Colors.white, comunidad.color, 70),
          title: Text(comunidad.nombre, style: TextStyle(color: Colors.black)),
          subtitle: Column(
            children: [
              SizedBox(height: 5),

              Row(
                children: [
                  Text(
                    comunidad.publico == false? 'Privada' : 'Pública',
                    style: TextStyle(color: Colors.black)
                  ),

                  SizedBox(width: 5),

                  Icon(
                    comunidad.publico == false? Icons.lock : Icons.lock_open,
                    color: Colors.black,
                    size: 14
                  )

                ]
              ),

              SizedBox(height: 5),

              Row(
                children:[
                  Expanded(
                    flex: 6,
                    child: Text(
                      '${comunidad.totalUsuarios.toString()} integrantes.',
                      style: TextStyle(color: Colors.black)
                    ),
                  ),

                  Spacer(flex: 1),

                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Icon(Icons.info, color: comunidad.color),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) => TarjetaComunidad(comunidad: comunidad)
                        );
                      }
                    )
                  )
                  
                ]
              )
            ],
          ),

          onTap: onTap?? () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => ComunidadPage(comunidad: comunidad))
          )
        ),

        Divider(color: Colors.black38)
      ]
    );
  }
}



