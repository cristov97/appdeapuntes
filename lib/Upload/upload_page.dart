import 'package:appuntes/Otros/validaciones.dart';
import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Upload/ui_multiArchivo.dart';
import 'selecionar_archivos.dart';
import 'upload_form.dart';

class UploadPage extends StatefulWidget {

  final List<ModeloArchivo> archivos;
  final String ruta;

  UploadPage({
    this.archivos,
    this.ruta
  });

  @override
  State<StatefulWidget> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  bool seleccionActiva = false;

  final background = Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Container(
      decoration: BoxDecoration(color: Colors.red[900], borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[ 

          Text(
            'DESCARTAR',
            style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)
          ),

          Icon(Icons.delete, color: Colors.white, size: 40)
        ]
      ) 
    )
  );

  @override
  void initState() {
    super.initState();

    if (widget.archivos != null) filePicker.data = widget.archivos;
    else filePicker.data = [];
  }

  void snackBar(BuildContext context, String text, {int duration = 7}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[900],
        duration: Duration(seconds: duration),
        content: Text(text)
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final Size pantalla = MediaQuery.of(context).size;

    final Function terminarSeleccion = () {
      filePicker.data.forEach((element) => element.isSelec = false);
      setState(() => seleccionActiva = false);
    };

    void onDismissed(DismissDirection direction, String nombre) {
      if(direction == DismissDirection.endToStart){
        setState(() => filePicker.eliminarArchivo(nombre));
      }
    }

    void addButton() => filePicker.multiSeleccion.then(
      (value) {
        setState((){
          bool repetidos = filePicker.agregarArchivos(value.files);
          if(repetidos == true){
            snackBar(context, 'Algunos archivos no se agregaron porque ya estaban en tu lista.');
          } 
        });       
      }              
    );

    void borrarSeleccionados(){
      List<ModeloArchivo> aux = [];

      for(int i = 0; i < filePicker.data.length; i++){

        if(filePicker.data[i].isSelec == false) aux.add(filePicker.data[i]); 
      }

      filePicker.data = aux; 
      setState(() => seleccionActiva = false);
    }

    void edicionMultiple(){

      ModeloArchivo multiDatos = ModeloArchivo.porDefecto(null);

      showDialog<bool>(
        context: context,
        builder: (dialogContext) => UploadForm(
          context: dialogContext,
          editarVarios: true,
          datos: multiDatos
        )
      )
      .then(
        (value) {
          for(int i = 0; i < filePicker.data.length; i++){
            if(filePicker.data[i].isSelec == true){
              filePicker.data[i].asignatura = multiDatos.asignatura;
              filePicker.data[i].autor      = multiDatos.autor;
              filePicker.data[i].year       = multiDatos.year;
              filePicker.data[i].solucion   = multiDatos.solucion;
              filePicker.data[i].detalle    = multiDatos.detalle;
            }
          }

          if (value == true){
            filePicker.data.forEach((element) => element.isSelec = false);
            setState(() => seleccionActiva = false);
          }
        }
      );  
    }

    void seleccionarTodos(){
      setState(() => filePicker.data.forEach((element) => element.isSelec = true));
    }

    void expansionChanged(int index){ 
      setState(() => filePicker.data[index].isExpanded = !filePicker.data[index].isExpanded);
    }

    void seleccionar(int index){
      setState(() {
        if(filePicker.data.every((element) => element.isSelec == false)){
          seleccionActiva = true;
        }

        filePicker.data[index].isSelec = !filePicker.data[index].isSelec;
        filePicker.data[index].isExpanded = false;

        if( filePicker.data[index].isSelec == false && 
            filePicker.data.where((element) => element.isSelec == true).length == 0
        ){
          seleccionActiva = false;
        }

      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(seleccionActiva == false? 'Compartir apuntes' : 'Seleccionar'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        actions: (
          seleccionActiva == false
          ? [IconButton(icon: Icon(Icons.add_box), onPressed: addButton)]
          : null
        ),
        leading: (
          seleccionActiva == false
          ? null
          : IconButton(icon: Icon(Icons.close_outlined), onPressed: terminarSeleccion)
        )
      ),

      body: filePicker.data.isEmpty
      ? Center(
        child: Text(
          'No hay archivos en la lista.',
          style: TextStyle(color: Colors.black45, fontSize: 20)
        )
      ) 

      : ListView.builder(
        padding: EdgeInsets.fromLTRB(
          pantalla.width * 0.00, pantalla.height * 0.02,
          pantalla.width * 0.02, pantalla.height * 0.1
        ),
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: filePicker.data.length,
        itemBuilder: (context, i) => GestureDetector(
        onLongPress: () => seleccionar(i),
          child: UiUploadArchivos(
            index              : i,
            datos              : filePicker.data[i],
            seleccion          : seleccionActiva,
            onExpansionChanged : (value) => expansionChanged(i),
            onDismissed        : onDismissed
          )
        )
      ),

      bottomNavigationBar: seleccionActiva == false? null : BottomNavigationBar(
        unselectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon  : Icon(Icons.select_all),
            label : 'Todos'
          ),
          BottomNavigationBarItem(
            icon  : Icon(Icons.edit),
            label : 'Editar'
          ),
          BottomNavigationBarItem(
            icon  : Icon(Icons.delete),
            label : 'Borrar'
          )
        ],

        onTap: (i){
          if(i == 0) seleccionarTodos();
          if(i == 1) edicionMultiple();
          if(i == 2) borrarSeleccionados();
        }
      ),

      floatingActionButton: (
        seleccionActiva == true || filePicker.data.isEmpty
        ? null 
        : FloatingActionButton(
          child: Icon(Icons.file_upload),
          onPressed: (){ 
            if(validar.completarDatos(filePicker.data) == false) Navigator.pop(context, filePicker.data);
            else snackBar(context, 'Procura que todos tus archivos tengan nombre y asignatura.');
          }
        )
      )
    );    
  }
}

class UploadFile {
  /*Future subirArchivo(fileName, filePath) async{
      await Firebase.initializeApp();
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);  
    storageReference.putFile(File(filePath));
  }*/
}

