import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Modelos/Modelo_comunidades.dart';
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
        usuarios:[
          Usuario('a'),
          Usuario('b'),
          Usuario('c'),
          Usuario('d'),
          Usuario('e'),
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
        usuarios:[
          Usuario('a'),
          Usuario('b'),
          Usuario('c'),
          Usuario('d'),
          Usuario('e'),
          Usuario('f'),
          Usuario('g'),
          Usuario('h'),
          Usuario('i'),
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
        itemCount: comunidades.length,
        itemBuilder: (context, i) => UiComunidad(
          titulo      : comunidades[i].nombre,
          descripcion : comunidades[i].descripcion,
          color       : comunidades[i].color,
          cantidad    : comunidades[i].usuarios.length,
          publico     : comunidades[i].publico,
          secciones   : comunidades[i].secciones
        ),
      )
    );
  }
}

class UiComunidad extends StatelessWidget{

  final String titulo;
  final String descripcion;
  final Color color;
  final int cantidad;
  final bool publico;
  final Image imagen;
  final List<Seccion> secciones;

  UiComunidad({
    this.titulo,
    this.descripcion,
    this.color,
    this.cantidad,
    this.publico,
    this.imagen,
    this.secciones
  });

  Widget avatar(Color text, Color background, double lado){
    return Container(
      width: lado, height: lado,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: imagen != null? imagen : Center(
        child: Text(
          titulo.substring(0,1),
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
          leading: avatar(Colors.white, color, 70),
          title: Text(titulo, style: TextStyle(color: Colors.black)),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [

                Text(
                  publico == false? 'Privada' : 'Pública',
                  style: TextStyle(color: Colors.black)
                ),

                SizedBox(width: 5),

                Icon(
                  publico == false? Icons.lock : Icons.lock_open,
                  color: Colors.black,
                  size: 14
                )

              ]
            )
          ),

          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ComunidadPage(
                tituloComunidad : titulo,
                descripcion     : descripcion,
                color           : color,
                cantidad        : secciones.length,
                secciones       : secciones,
              )
            )
          )
        ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Row(
            children:[

              Spacer(flex: 3),

              Expanded(
                flex: 6,
                child: Text(
                  '${cantidad.toString()} integrantes.',
                  style: TextStyle(color: Colors.black)
                ),
              ),

              Spacer(flex: 1),

              Expanded(
                flex: 2,
                child: GestureDetector(
                  child: Icon(Icons.info, color: color),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => TarjetaComunidad(
                        color       : color,
                        titulo      : titulo,
                        descripcion : descripcion,
                        publico     : publico
                      )
                    );
                  }
                )
              )
              
            ]
          )
        ),

        Divider(color: Colors.black38)
      ]
    );
  }
}



