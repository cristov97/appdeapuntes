import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appuntes/Widgets/optionListTileWidget.dart';
import 'op_identificador.dart';

class Ajustes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes>{

  OpIdentificador iden = OpIdentificador();
  
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'Lista de archivos',
              style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)
            )
          ),

          OptionListTile(
            title: 'Indicador de archivo',
            subtitle: iden.subtitle,
            opciones: iden.options,
            keyOpciones: Identificador.values,
            group: iden.groupValue,
            changes: (dynamic val, String text){
              setState(() { 
                OpIdentificador.option = val;
                OpIdentificador.textOption = text;
              }); 
            }
          )
        ],
      )
    );
  }
}

abstract class Options{ 
  static String textOption;
  static dynamic option;

  List<String> options;
  
  Map<String, dynamic> get porDefecto{
    return {
      'textOption': String,
      'option': dynamic
    };
  }
  
  get groupValue{
    if(option == null){
      return porDefecto['option']; 
    }
    else{
      return option;
    }
  }

  String get subtitle{
    if(option == null){
      return porDefecto['textOption']; 
    }
    else{
      return textOption;
    }
  }
}


