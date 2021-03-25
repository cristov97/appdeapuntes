import 'package:flutter/material.dart';

class TarjetaComunidad extends StatelessWidget {
  final Color color;
  final String titulo;
  final String descripcion;
  final bool publico;

  TarjetaComunidad({
    this.color,
    this.titulo,
    this.descripcion,
    this.publico
  });

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
          color: color,
          boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(0, 1))]
        ),
        child: Text(
          titulo,
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
            color: color,
            fontSize: 16
          )
        ),

        SizedBox(height: 8),

        Text(descripcion),

        SizedBox(height: 15),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: FlatButton(
            color: color.withAlpha(220),
            textColor: Colors.white,
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
          ),
        )
      ]
    );
  }
}

