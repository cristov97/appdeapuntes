import 'dart:async';

import 'package:flutter/material.dart';

import 'OpcionesPorArchivo/reportar.dart';
import 'avatar_archivos.dart';
import 'tarjeta_archivos.dart';

class UiArchivo extends StatelessWidget{
  @required final String nombre;
  @required final String asignatura;
  final String year;
  final String detalle;
  final bool solucion;
  final String autor;
  final int likes;
  final String extension;
  final bool eliminarReporte;
  final Function onTap;
  
  UiArchivo({
    this.nombre,
    this.asignatura, 
    this.year, 
    this.detalle, 
    this.solucion, 
    this.autor, 
    this.likes, 
    this.extension,
    this.eliminarReporte = false,
    this.onTap
  });

  final List<PopupMenuEntry<String>> _items = <String>[
    'Reportar',
    ].map<PopupMenuEntry<String>>(
    (String valor) => PopupMenuItem<String>(
      child: Text(valor),
      value: valor
    )
  ).toList();

  @override
  Widget build(BuildContext context) {
    
    void reportButton(){
      showDialog(
        context: context,
        builder: (context) => Report(nombre)
      );
    }

    return Column(
      children:[
        ListTile(
          onTap: onTap,
          leading: AvatarArchivo(nombre, extension),
          title: Text(nombre, maxLines: 2, overflow: TextOverflow.ellipsis),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(asignatura),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Expanded(
                    flex: 6,
                    child: Text(
                      likes != 0 && likes != null? 'A ${likes.toString()} personas les resultó útil.'
                      : 'No ha sido recomendado aún.'
                    )
                  ),

                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(Icons.info, color: Colors.blue[800]),
                      splashColor: Colors.blue[800],
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) => TarjetaArchivo(
                            nombre     : nombre,
                            asignatura : asignatura,
                            detalle    : detalle,
                            year       : year,
                            autor      : autor,
                            solucion   : solucion
                          )                   
                        );
                      }
                    )
                  ), 
        
                  eliminarReporte == true? SizedBox() : Expanded(
                    flex: 2,
                    child: PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: Colors.blue[800]),
                      elevation: 15,
                      offset: Offset(10,10),
                      itemBuilder: (context) => _items,
                      onSelected: (String item){
                        reportButton();
                      }
                    )
                  )
                ]
              ),
            ],
          ) 
        ),
        
        Divider(color: Colors.black38)
      ]
    );
  }
}