import 'package:flutter/material.dart';

class TextInformation extends StatelessWidget{
  final String parametro;
  final String variable;
  final Color colorTexto;

  TextInformation(this.parametro, this.variable, {this.colorTexto});

  @override
  Widget build(BuildContext context) {
    return Row(  
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: parametro,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )
                ),
                TextSpan(
                  text: variable == null? 'Sin datos.': variable,
                  style: TextStyle(color: Colors.black)   
                )
              ]
            )
          )
        )
      ]
    );
  }
}

