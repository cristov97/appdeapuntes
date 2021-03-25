import 'dart:async';

import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:file_picker/file_picker.dart';

class Extensiones{
  static List<String> lista = [
    'pdf',
    'docx',
    'ppt'
  ];
}

class SeleccionArchivos{

  FilePickerResult result = FilePickerResult([]);

  Future<FilePickerResult> get seleccionImagen async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.image, 
    );   
    return result;  
  }

  Future<FilePickerResult> get multiSeleccion async {
   result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: Extensiones.lista,
      allowMultiple: true
    );
    return result; 
  }

  List<ModeloArchivo> _data;
  bool _modificado;
  bool _enviado;

  List<ModeloArchivo> get data => _data;
  set data(List<ModeloArchivo> data) => this._data = data;

  bool get enviado => _enviado;
  set enviado(bool enviado) => this._enviado = enviado;

  bool get modificado =>_modificado;
  set modificado(bool modificado) => this._modificado = modificado;

  void eliminarArchivo(String nombre) => data.removeWhere((item) => item.archivo.name == nombre);
  
  List<String> get nombreArchivos => _data.map((e) => e.archivo.name).toList();

  bool agregarArchivos(Iterable<PlatformFile> lista){
    
    List<PlatformFile> listaNueva = lista.where(
      (element) => !nombreArchivos.contains(element.name)
    ).toList();

    if(_data.isNotEmpty){

      _data.addAll(
        List.generate(listaNueva.length, (i) => ModeloArchivo.porDefecto(listaNueva[i]))
      );
    }
    else{
      
      _data = List.generate(lista.length, (i) => ModeloArchivo.porDefecto(lista.toList()[i]));
    }

    if(listaNueva.length == lista.length){
      return false;
    }
    else{
      listaNueva.clear();
      return true;
    }
  }
}

final filePicker = SeleccionArchivos();


