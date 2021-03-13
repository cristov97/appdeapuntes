import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';

import 'package:appuntes/Upload/ui_multiArchivo.dart';
import 'selecionar_archivos.dart';
import 'upload_form.dart';

class UploadPage extends StatefulWidget {
  final FilePickerResult result;
  UploadPage({this.result});
  @override
  State<StatefulWidget> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  ModificableAppBar appBar = ModificableAppBar(false);

  final background = Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(25) 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[ 
          Text(
            'DESCARTAR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 40
          )
        ]
      ) 
    )
  );

  @override
  void initState() {
    super.initState();
  
    filePicker.data = List.generate(
      widget.result.count,
      (i) => ModelUpload.porDefecto(widget.result.files[i])
    );
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
    final EdgeInsets padding = EdgeInsets.fromLTRB(
      pantalla.width*0.00, pantalla.height*0.02,
      pantalla.width*0.02, pantalla.height*0.1
    );

    final Function addButton = () => filePicker.multiSeleccion.then(
      (value) {
        setState((){
          bool repetidos = filePicker.agregarArchivos(value.files);
          if(repetidos == true){
            snackBar(context, 'Algunos archivos no se agregaron porque ya estaban en tu lista.');
          } 
        });       
      }              
    );

    final Function borrarSeleccionados = (){
      List<ModelUpload> aux = [];

      for(int i = 0; i < filePicker.data.length; i++){
        if(filePicker.data[i].isSelec == false){
          aux.add(filePicker.data[i]);
        }
      }

      filePicker.data = aux; 
      setState(() => appBar.selecActivo = false);
    };

    final Function terminarSeleccion = () {
      filePicker.data.forEach((element) => element.isSelec = false);
      setState(() => appBar.selecActivo = false);
    };
    
    final Function edicionMultiple = (){

      ModelUpload multiDatos = ModelUpload.porDefecto(null);

      showDialog(
        context: context,
        builder: (dialogContext) => UploadForm(
          context: dialogContext,
          editarVarios: true,
          datos: multiDatos
        )
      ).whenComplete(
        () {
          for(int i = 0; i < filePicker.data.length; i++){
            if(filePicker.data[i].isSelec == true){
              filePicker.data[i].asignatura = multiDatos.asignatura;
              filePicker.data[i].autor = multiDatos.autor;
              filePicker.data[i].year = multiDatos.year;
              filePicker.data[i].solucion = multiDatos.solucion;
              filePicker.data[i].detalle = multiDatos.detalle;
            }
          }
          if(multiDatos != ModelUpload.porDefecto(null)){
            filePicker.data.forEach((element) => element.isSelec = false);
            setState(() => appBar.selecActivo = false);
          }
        }
      );  
    };

    final Function seleccionarTodos = (){
      setState(() => filePicker.data.forEach((element) => element.isSelec = true));
    };

    void expansionChanged(int index){ 
      setState(() => filePicker.data[index].isExpanded = !filePicker.data[index].isExpanded);
    }

    void seleccionar(int index){
      setState(() {
        if(filePicker.data.every((element) => element.isSelec == false)){
          appBar.selecActivo = true;
        }

        filePicker.data[index].isSelec = !filePicker.data[index].isSelec;

        if(filePicker.data[index].isSelec == false 
          && filePicker.data.where((element) => element.isSelec == true).length == 0
        ){
          appBar.selecActivo = false;
        }

      });
    }

    Future<Duration> onDismissed(DismissDirection direction, int index){
      if(direction == DismissDirection.endToStart){
        Future.delayed(Duration(milliseconds: 1600));
        setState(() => filePicker.eliminarArchivo(index));
      }
      return Future.delayed(Duration(milliseconds: 1600));
    }

    void cambiarArchivo(int index){
      filePicker.seleccion.then(
        (value) {

          bool mismoNombre = filePicker.nombreArchivos.any((e) => e == value.files.single.name);

          if(value != null){
            if(!mismoNombre){
              setState(() => filePicker.data[index] = ModelUpload.porDefecto(value.files.single));
            }
            else{
              snackBar(context, 'El archivo que elegiste ya estaba seleccionado.', duration: 5);
            }
          }
        }
      );
    }

    return Scaffold(
      appBar: (
        appBar.selecActivo == false
        ? appBar.porDefecto(addButton)
        : appBar.seleccion(
          count: filePicker.data.where((element) => element.isSelec == true).length,
          finish: terminarSeleccion,
          delete: borrarSeleccionados,
          edit: edicionMultiple,
          selectAll: seleccionarTodos
        )
      ),
      body: ListView.builder(
        padding: padding,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: filePicker.data.length,
        itemBuilder: (context, i) => GestureDetector(
        onLongPress: () => seleccionar(i),
          child: UiUploadArchivos(
            index: i,
            datos: filePicker.data[i],
            seleccion: appBar.selecActivo,
            onExpansionChanged: (value) => expansionChanged(i),
            onPressedTrailing: () => cambiarArchivo(i),
            onDismissed: onDismissed
          )
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.file_upload
        ),
        onPressed: (){ 
          print('subido');
        }
      )
    );    
  }
}

class ModificableAppBar{

  bool selecActivo;
  ModificableAppBar(this.selecActivo);
  
  Widget porDefecto(Function action) {
    return AppBar(
      title: Text('Compartir Apuntes'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          icon: Icon(
            Icons.add_box
          ),
          onPressed: action
        )
      ]
    );
  }

  Widget seleccion({int count, Function finish, Function delete, Function edit, Function selectAll}){
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back
        ),
        onPressed: finish,
      ),
      title: Text('$count'),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          icon: Icon(
            Icons.library_add_check
          ),
          onPressed: selectAll
        ),
        
        IconButton(
          icon: Icon(
            Icons.edit
          ),
          onPressed: edit
        ),

        IconButton(
          icon: Icon(
            Icons.delete
          ),
          onPressed: delete
        )
      ]
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
