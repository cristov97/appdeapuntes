import 'package:flutter/material.dart';

import 'OpcionesPorArchivo/reportar.dart';
import 'avatar_archivos.dart';
import 'tarjeta_archivos.dart';

class UiArchivo extends StatelessWidget{
  @required final String nombre;
  final String year;
  @required final String asignatura;
  final String detalle;
  final bool solucion;
  final String autor;
  final int likes;
  final String extension;
  
  UiArchivo({
    this.nombre,
    this.year, 
    this.asignatura, 
    this.detalle, 
    this.solucion, 
    this.autor, 
    this.likes, 
    this.extension
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
          leading: AvatarArchivo(nombre, extension),
          title: Text(nombre, maxLines: 2, overflow: TextOverflow.ellipsis),
          shape: RoundedRectangleBorder(side: BorderSide(style: BorderStyle.solid)),
          subtitle: Text(asignatura),  
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(flex: 2),
            
            Expanded(
              flex: 6,
              child: Text(
                likes != 0? 'A ${likes.toString()} personas les resultó útil.'
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
  
            Expanded(
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

        Divider(color: Colors.black38)
      ]
    );
  }
}