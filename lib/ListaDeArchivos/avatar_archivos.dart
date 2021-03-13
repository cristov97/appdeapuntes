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
  final AvatarColor color = AvatarColor();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorAvatar,
      child: Text(
        textAvatar,
        style: TextStyle(
          fontSize: iden.fontSize,
          color: Colors.white
        )
      )
    ); 
  }

  Color get colorAvatar{
    if(OpIdentificador.option == null){
      return color.aleatorio;
    }
    else{
      if(OpIdentificador.option == Identificador.inicial){
        return color.aleatorio;
      }
      else if(OpIdentificador.option == Identificador.archExtension){
        return color.porExtension[extension];
      }
      else{
        throw null;
      }
    }
  }

  String get textAvatar{
    if(OpIdentificador.option == Identificador.inicial){
      return nombre.substring(0,1).toUpperCase();
    }
    else if(OpIdentificador.option == Identificador.archExtension){
      if(extension.contains('pdf')){
        return extension;
      }
      else if(extension.contains('docx')){
        return 'word';
      }
      else if(extension.contains('ppt')){
        return extension;
      }
      else{
        return nombre.substring(0,1).toUpperCase();
      }
    }
    else{
      return nombre.substring(0,1).toUpperCase();
    }
  }
}

class AvatarColor{

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
