import 'package:appuntes/Widgets/ModalBottomSheetWidget.dart';
import 'package:appuntes/Widgets/compartirRecursosFormWidget.dart';
import 'package:flutter/material.dart';

import 'package:appuntes/Upload/upload_form.dart';
import 'package:appuntes/ListaDeArchivos/ui_archivos.dart';
import 'package:appuntes/Modelos/Modelo_archivos.dart';

List<ModeloArchivo> misArchivos = [
  ModeloArchivo.mostrar(
    nombre: '1',
    asignatura: 'lalalalalalalalal lalalalla lala'
  )
];

List<ModeloArchivo> utiles = [
  ModeloArchivo.mostrar(
    nombre: 'so',
    asignatura: 'mates'
  )
];

class MisApuntes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MisApuntesState();
}

class MisApuntesState extends State<MisApuntes> with TickerProviderStateMixin {
  
  List<Widget> tabs = [
    Text('Subidos'),
    Text('Útiles')
  ];

  ModeloArchivo editable;
  TabController tabController;

  @override
  void initState() { 
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis apuntes'),
        centerTitle: true,
        bottom: TabBar(
          tabs                 : tabs,
          controller           : tabController,
          indicator            : BoxDecoration(color: Colors.white),
          labelPadding         : EdgeInsets.symmetric(vertical: 5),
          labelColor           : Colors.black,
          unselectedLabelColor : Colors.white70,
          onTap                : (i) => setState(() => tabController.index = i)
        ),
        actions: [
          tabController.index == 0? IconButton(
            icon: Icon(Icons.add_box),
            onPressed: (){}
          ) : SizedBox(),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){}
          )
        ]
      ),

      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: misArchivos.length,
            itemBuilder: (context, i) => UiArchivo(
              archivo: misArchivos[i],
              eliminarReporte : true,
              onTap: () {
                editable = misArchivos[i];
                showModalBottomSheet(
                  context: context,
                  builder: (context) => menuMisArchivos(i)
                );
              }
            )
          ),

          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: utiles.length,
            itemBuilder: (context, i) => UiArchivo(
              archivo: utiles[i],
              onTap      : (){
                showModalBottomSheet(
                  context: context,
                  builder: (context) => menuUtiles(i)
                );
              }
            )
          )

        ]
      )
    );
  }

  Widget menuMisArchivos(int index){
    return ModalBottomSheet(
      items: [
        ItemModalBottomSheet(
          icon: Icons.edit,
          option: 'Editar datos',
          onTap: () {
            Navigator.pop(context);
            showDialog<bool>(
              context: context,
              builder: (context) => UploadForm(datos: editable)
            )
            .then((value) => value == true? setState(() => misArchivos[index] = editable) : null);
          }
        ),

        ItemModalBottomSheet(
          icon: Icons.delete,
          option: 'Borrar archivo',
          onTap   : () {
            Navigator.pop(context);
            showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('¿Seguro/a que quieres eliminar el archivo?'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('Eliminar')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar')
                  )
                ]
              )
            )
            .then(
              (value) => (
                value == true
                ? setState(() => misArchivos.removeAt(index))
                : null
              )
            );
          }
        )
      ]
    );
  }

  Widget menuUtiles(int index){
    return ModalBottomSheet(
      items: [
        ItemModalBottomSheet(
          icon: Icons.send,
          option: 'Enviar recomendación',
          onTap: () {
            Navigator.pop(context);
            showDialog<bool>(
              context: context,
              builder: (context) => CompartirRecurso(tituloDialogo: 'Recomendar archivo')
            )
            .then((value){ 
              if(value == true) ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red[900],
                  content: Text('La recomendación fue enviada.')
                )
              );
            });
          }
        ),

        ItemModalBottomSheet(
          icon: Icons.delete,
          option: 'Borrar archivo',
          onTap   : () {
            Navigator.pop(context);
            showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                content: Text('¿Seguro/a que quieres eliminar el archivo?'),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('Eliminar')
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar')
                  )
                ]
              )
            )
            .then(
              (value) => (
                value == true
                ? setState(() => utiles.removeAt(index))
                : null
              )
            );
          }
        ) 
        
      ]
    );
  }
}

