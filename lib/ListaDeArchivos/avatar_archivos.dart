import 'dart:math';

import 'package:flutter/material.dart';

import 'package:appuntes/Ajustes/op_identificador.dart';

class AvatarArchivo extends StatelessWidget{
  final String nombre;
  final String extension;

  AvatarArchivo(
    this.nombre,
    this.extension
  );

  final OpIdentificador iden = OpIdentificador();
  final ColorArchivo color = ColorArchivo();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorAvatar,
      child: Text(
        textAvatar,
        style: TextStyle(fontSize: iden.fontSize, color: Colors.white)
      )
    ); 
  }

  Color get colorAvatar{
    switch (OpIdentificador.option) {
      case Identificador.inicial:  
        return color.aleatorio;
        break;

      case Identificador.archExtension:
        return color.porExtension[extension];
        break;

      default:
        return color.aleatorio;
        break;
    } 
  }

  String get textAvatar{
    switch (OpIdentificador.option) {
      case Identificador.inicial:
        return nombre.substring(0,1).toUpperCase();
        break;
      case Identificador.archExtension:
        if(extension.contains('docx')) return 'word';
        else return extension;
        break;  
      default:
        return nombre.substring(0,1).toUpperCase();
        break;
    }
  }
}

class ColorArchivo{

  Color get aleatorio{
    int i = Random.secure().nextInt(7);
    List<Color> colors = [
      Colors.blue[700],
      Colors.yellow[800],
      Colors.red,
      Colors.green,
      Colors.pink,
      Colors.purple,
      Colors.indigoAccent,
      Colors.orange
    ];
    
    return colors[i];    
  }


  Map<String, Color> get porExtension{
    Map<String, Color> color = {
      'pdf': Colors.red,
      'docx': Colors.blue[900],
      'ppt': Colors.yellow[700]
    };
    return color;
  }
}
