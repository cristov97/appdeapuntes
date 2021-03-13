import 'package:flutter/material.dart';

import 'package:appuntes/ListaDeArchivos/lista_archivos.dart';
import 'package:appuntes/Otros/textInformationWidget.dart';
import 'comunidad_page.dart';

class MisDatos{
  String nick;
  List<Comunidad> comunidades;
  MisDatos(this.comunidades);
}

class Usuario{
  String nick;
  String correo;
  Image avatar;
  Usuario(this.nick);
}

class Seccion{
  String titulo;
  List<DatosArchivos> archivos;
  Seccion({
    this.titulo,
    this.archivos
  });
}

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

class Comunidades extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    List<Comunidad> comunidades = [
      Comunidad(
        nombre: 'UV',
        descripcion: 'mns dmnfmns dmnfn knsfkn kaskdkn ',
        publico: false,
        color: Colors.blue,
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
              DatosArchivos(
                nombre: 'INGENIERIA DE LOS MATERIALES TAREA 3',
                year: '2006',
                asignatura: 'INGENIERIA DE LOS MATERIALES',
                like: 50,
                extension: 'ppt'
              ), 
              DatosArchivos(
                nombre: 'Prueba 2 de ecuaciones diferenciales 2021',
                year: '2021',
                asignatura: 'ECUACIONES DIFERENCIALES',
                solucion: false,
                autor: 'UV',
                like: 2,
                extension: 'pdf'
              ), 
            ]
          )
        ]
      ),
      Comunidad(
        nombre: 'El rincon de las matematicas y la tecnologia',
        descripcion: 'mnsdmnfmnsdmnfn knsfkn kaskdkn 123124124129740182094818248102 93893893 93893 93029 4749',
        publico: true,
        color: Colors.red,
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
              DatosArchivos(
                nombre: 'Guía 2: solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. 2018',
                year: '2018',
                asignatura: 'ECUACIONES DIFERENCIALES',
                descripcion: 'solucion de ecuaciones de diferenciales homogéneas de orden mayor por el método de variación de parámetros. ',
                solucion: true,
                autor: 'UV',
                like: 0,
                extension: 'pdf'
              ),
              DatosArchivos(
                nombre: 'Prueba 3, 2020',
                year: '2020',
                asignatura: 'TALLER DE INTEGRACIÓN A LA INGENIERÍA INDUSTRIAL III',
                descripcion: null,
                solucion: true,
                autor: 'UV',
                like: 1,
                extension: 'pdf'
              ),
              DatosArchivos(
                nombre: 'taller 1, informatica I',
                asignatura: 'INFORMÁTICA I',
                solucion: false,
                autor: 'UV',
                like: 1000,
                extension: 'docx'
              ), 
              DatosArchivos(
                nombre: 'Prueba 2 ALGREBA 2021 SEDE SANTIAGO',
                asignatura: 'ÁLGEBRA',
                like: 20,
                extension: 'docx'
              ),
              DatosArchivos(
                nombre: '545454544545',
                asignatura: 'INFORMÁTICA I',
                descripcion: 'EXPRESIONES REGULARES AASDASDASD',
                solucion: true,
                autor: 'UV',
                like: 6,
                extension: 'ppt'
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
                ),   
              ]
            )
          ),
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ComunidadPage(
                titulo      : titulo,
                descripcion : descripcion,
                color       : color,
                cantidad    : secciones.length,
                secciones   : secciones,
              )
            )
          ),
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
                      builder: (context) => SimpleDialog(
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        titlePadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: avatar(color, Colors.white, 60),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              flex: 5,
                              child: Text(
                                titulo,
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                )
                              )
                            )
                          ],
                        ),

                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15
                        ),

                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: TextInformation('Descripción : ', descripcion)
                          ),

                          SizedBox(height: 15),

                          FlatButton(
                            color: Colors.white70,
                            textColor: Colors.black87,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(publico == true? 'Unirme' : 'Enviar solicitud'),
                                SizedBox(width: 5),
                                Icon(publico == true? Icons.person : Icons.send)
                              ],
                            ),
                            onPressed: () {
                              
                            },
                          )
                        ]
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



