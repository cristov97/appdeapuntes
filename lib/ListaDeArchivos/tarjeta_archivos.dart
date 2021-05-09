import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:flutter/material.dart';

import 'package:appuntes/Widgets/textInformationWidget.dart';
 
class TarjetaArchivo extends StatelessWidget {

  final ModeloArchivo archivo;

  TarjetaArchivo({
    this.archivo
  });

  final shapeDialog = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15)
  );

  final sizedBoxText = SizedBox(height: 5);

  final titleDialog = Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        colors: [
          Colors.blue,
          Colors.blue[800],
          Colors.blue[900]  
        ]
      )
    ),
    
    child: Center(
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 27
          ),
          SizedBox(width: 5),
          Text(
            'INFORMACIÓN', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              shadows: [
                Shadow(
                  color: Colors.blueGrey[200],
                  offset: Offset(0.5, 0.5)
                )
              ]
            )
          )
        ]
      )
    )
  );
  
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: titleDialog,  
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      backgroundColor: Colors.white, 
      shape: shapeDialog,
      children:[ 
        TextInformation('Nombre: ', archivo.nombre),
        sizedBoxText,
        TextInformation('Asignatura: ', archivo.asignatura),
        sizedBoxText,
        TextInformation('Autor/institución: ', archivo.autor),
        sizedBoxText,
        TextInformation('Año: ', archivo.year),
        sizedBoxText,
        TextInformation('Detalles: ', archivo.detalle),
        sizedBoxText,
        TextInformation('Pauta/solucionario: ', archivo.solucion == true? 'Sí':'No')                                                                  
      ]           
    );
  }
}