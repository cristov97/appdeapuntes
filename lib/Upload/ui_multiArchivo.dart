import 'dart:async';
import 'package:flutter/material.dart';

import 'package:appuntes/Widgets/textInformationWidget.dart';
import 'package:appuntes/Upload/selecionar_archivos.dart';
import 'upload_form.dart';

class UiUploadArchivos extends StatelessWidget{
  final int index; 
  final bool seleccion;
  final ModelUpload datos;
  final Function onPressed; 
  final Function onDismissed;
  final Function(bool) onExpansionChanged; 
  final Function onPressedTrailing; 

  UiUploadArchivos({
    this.datos, 
    this.index,
    this.seleccion,
    this.onExpansionChanged,
    this.onPressedTrailing, 
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

    final item = Column(
      children: [
        Row(
          children: [
            Icon(Icons.keyboard_arrow_left_sharp, color: Colors.black38),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    colors: [Colors.blue, Colors.blue[800], Colors.blue[900]]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [BoxShadow(color: Colors.blueGrey[200], offset: Offset(3, 3))]
                ),
                child: StreamBuilder<bool>(
                  stream: streamDatos,
                  builder: (context, snapshot) {
                    return ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('$i', style: TextStyle(fontSize: 20))
                      ),

                      title: Text(
                        datos.archivo.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Colors.white)
                      ),

                      subtitle: seleccion == true? null : Row(
                        children: [

                          Text(
                            datos.isExpanded == false? 'Mostrar datos' : 'Ocultar datos',
                            style: TextStyle(
                            color: Colors.white  
                            )
                          ),

                          Icon(
                            datos.isExpanded == false? Icons.arrow_drop_down : Icons.arrow_drop_up,
                            color: Colors.white
                          )

                        ]
                      ),

                      trailing: seleccion == true? null : IconButton(
                        icon: Icon(Icons.folder),
                        color: Colors.amber,
                        onPressed: onPressedTrailing
                      ),

                      initiallyExpanded: datos.isExpanded,
                      onExpansionChanged: onExpansionChanged,
                      tilePadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                    
                                    Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                      size: 18
                                    )
                                  ]
                                ),

                                onPressed: (){             
                                  showDialog<bool>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) => UploadForm(
                                      context: dialogContext,
                                      datos: datos
                                    )
                                  ).then((value) => actualizarDatos(value)); 
                                },
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
              ),
            ),
          ],
        ),

        Divider()
      ]
    );

    final itemSeleccionado = Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: [Colors.green, Colors.green[700],Colors.green[800]]
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15)
            ),
            boxShadow: [BoxShadow(color: Colors.blueGrey[200], offset: Offset(3, 3))]
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.check, color: Colors.blue)
            ),
            contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            title: Text(
              datos.archivo.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              )
            )
          )   
        ),
        Divider()
      ],
    );

    final itemDismissible = Dismissible(
      key: Key(datos.archivo.name),
      direction: DismissDirection.endToStart,
      resizeDuration: Duration(milliseconds: 800),
      background: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red[900],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[

              Text(
                'DESCARTAR',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
              ),

              Icon(Icons.delete, color: Colors.white, size: 40)
              
            ]
          ) 
        )
      ),
      onDismissed: (direction) => onDismissed(direction, index),
      child: item
    );
    
    return datos.isSelec == true? itemSeleccionado : seleccion == true? item : itemDismissible;
  }
}