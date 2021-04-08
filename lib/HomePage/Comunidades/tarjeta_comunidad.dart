import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_notificacion.dart';
import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import '../../mis_datos.dart';

class TarjetaComunidad extends StatelessWidget {
  final Comunidad comunidad;

  TarjetaComunidad({this.comunidad});
  
  Notificacion notificacion;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      titlePadding: EdgeInsets.zero,
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: comunidad.color,
          boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(0, 1))]
        ),
        child: Text(
          comunidad.nombre,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            fontSize: 18
          )
        ),
      ),

      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),

      children: [
        Text(
          'Descripción de la comunidad:',
          style: TextStyle(
            color: comunidad.color,
            fontSize: 16
          )
        ),

        SizedBox(height: 8),

        Text(comunidad.descripcion),

        SizedBox(height: 15),
         
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => comunidad.color.withAlpha(220)),
              textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(comunidad.publico == true? 'Unirme' : 'Enviar solicitud'),
                SizedBox(width: 5),
                Icon(comunidad.publico == true? Icons.person : Icons.send)
              ],
            ),

            onPressed: () {
              notificacion = Notificacion.comunidad(
                tipo  : Notificar.solicitud,
                emisor: misDatos,
                
                comunidad: comunidad
              );
            }
          )
        )
      ]
    );
  }
}

