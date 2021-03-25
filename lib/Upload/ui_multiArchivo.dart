import 'dart:async';
import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Widgets/textInformationWidget.dart';
import 'package:appuntes/Upload/selecionar_archivos.dart';
import 'upload_form.dart';

class UiUploadArchivos extends StatelessWidget{
  final int index; 
  final bool seleccion;
  final ModeloArchivo datos;
  final Function onPressed; 
  final Function onDismissed;
  final Function(bool) onExpansionChanged; 

  UiUploadArchivos({
    this.datos, 
    this.index,
    this.seleccion,
    this.onExpansionChanged,
    this.onPressed, 
    this.onDismissed
  });

  final StreamController<bool> _controlDatos = StreamController<bool>();
  Stream<bool> get streamDatos => _controlDatos.stream;
  Function(bool) get actualizarDatos => _controlDatos.sink.add;

  void dispose(){
    if(filePicker.enviado == true){
      _controlDatos.close();
    }
  }

  @override
  Widget build(BuildContext context) {

    final int i = index + 1; 

    final borderRadius = BorderRadius.only(
      topRight: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );

    final paddingChildItem = EdgeInsets.fromLTRB(0, 10, 0, 10);
    final paddingContainerItem = EdgeInsets.fromLTRB(13, 0, 13, 0);

    final boxDecorationItem = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        colors: (
          datos.isSelec == false
          ? [Colors.blue, Colors.blue[800], Colors.blue[900]]
          : [Colors.green, Colors.green[700],Colors.green[800]]
        )
      ),
      borderRadius: (
        datos.isSelec == false
        ? BorderRadius.all(Radius.circular(12))
        : borderRadius
      ),
      boxShadow: [BoxShadow(color: Colors.blueGrey[200], offset: Offset(2, 2))]
    );

    final circleAvatarItem = CircleAvatar(
      backgroundColor: Colors.white,
      child: (
        datos.isSelec == false
        ? Text('$i', style: TextStyle(fontSize: 20)) 
        : Icon(Icons.check, color: Colors.blue)
      )
    );

    final titleItem = Text(
      datos.archivo.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white
      )
    );

    final Function onPressed = (){             
      showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) => UploadForm(
          context : dialogContext,
          datos   : datos
        )
      )
      .then((value) => actualizarDatos(value)); 
    };

    final item = Dismissible(
      key: Key(datos.archivo.name),
      direction: DismissDirection.endToStart,
      resizeDuration: Duration(milliseconds: 1000),
      movementDuration: Duration(milliseconds: 500),
      onDismissed: (direction) => onDismissed(direction, datos.archivo.name),
      background: Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: Container(
          decoration: BoxDecoration(color: Colors.red[900], borderRadius: borderRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'DESCARTAR',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
              ),

              SizedBox(width: 30),

              Icon(Icons.delete, color: Colors.white, size: 40),
            ]
          ) 
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.keyboard_arrow_left_sharp, color: Colors.black38),
              Expanded(
                child: Container(
                  padding: paddingContainerItem,
                  decoration: boxDecorationItem,
                  child: StreamBuilder<bool>(
                    stream: streamDatos,
                    builder: (context, snapshot) {
                      return ExpansionTile(
                        leading: circleAvatarItem,
                        title: titleItem,
                        trailing: Icon(
                          datos.isExpanded == false? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          color: Colors.white
                        ),

                        initiallyExpanded: datos.isExpanded,
                        onExpansionChanged: onExpansionChanged,
                        tilePadding: paddingChildItem,
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 15, 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                seleccion == true? SizedBox() : TextButton(
                                  onPressed: onPressed,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Editar',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        )
                                      ),

                                      SizedBox(width: 5.0),
                                      
                                      Icon(Icons.edit, color: Colors.blue, size: 18)
                                    ]
                                  )
                                ),

                                TextInformation('Nombre: ', datos.nombre),
                                TextInformation('Asignatura: ', datos.asignatura),
                                TextInformation('Año: ', datos.year),
                                TextInformation('Autor/Institución: ', datos.autor),
                                TextInformation('Tiene solucionario/respuestas: ', datos.solucion == true? 'Sí':'No'),
                                TextInformation('Detalles: ', datos.detalle)
                              ]
                            )
                          )
                        ]
                      );
                    }
                  )       
                )
              )
            ]
          ),

          SizedBox(height: 15)
        ]
      )
    );

    final itemSeleccionado = Column(
      children: [
        Container(
          padding: paddingContainerItem,
          decoration: boxDecorationItem,
          child: ListTile(
            leading: circleAvatarItem,
            contentPadding: paddingChildItem,
            title: titleItem
          )   
        ),

        SizedBox(height: 15)
      ],
    );
    
    return datos.isSelec == false? item : itemSeleccionado;
  }
}