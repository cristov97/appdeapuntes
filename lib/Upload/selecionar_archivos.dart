import 'dart:async';

import 'package:file_picker/file_picker.dart';

class Extensiones{
  static List<String> lista = [
    'pdf',
    'docx',
    'ppt'
  ];
}

class SeleccionArchivos{

  FilePickerResult result;

  Future<FilePickerResult> get seleccion async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom, 
      allowedExtensions: Extensiones.lista, 
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

  List<ModelUpload> _data;
  bool _modificado;
  bool _enviado;

  List<ModelUpload> get data => _data;
  set data(List<ModelUpload> data) => this._data = data;

  bool get enviado => _enviado;
  set enviado(bool enviado) => this._enviado = enviado;

  bool get modificado =>_modificado;
  set modificado(bool modificado) => this._modificado = modificado;

  void eliminarArchivo(int index) => data.removeAt(index);
  
  List<String> get nombreArchivos => _data.map((e) => e.archivo.name).toList();

  bool agregarArchivos(Iterable<PlatformFile> lista){
    
    List<PlatformFile> listaNueva = lista.where(
      (element) => !nombreArchivos.contains(element.name)
    ).toList();

    if(_data.isNotEmpty){

      _data.addAll(
        List.generate(listaNueva.length, (i) => ModelUpload.porDefecto(listaNueva[i]))
      );
    }
    else{
      _data = List.generate(lista.length, (i) => ModelUpload.porDefecto(lista.toList()[i]));
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

class ModelUpload{
  PlatformFile _archivo;
  String _id;
  String _nombre;
  String _asignatura;
  String _year;
  String _detalle;
  String _autor;
  bool _solucion;
  bool _isExpanded;
  bool _isSelec;

  ModelUpload(
    this._archivo,
    this._id, 
    this._nombre, 
    this._asignatura, 
    this._year, 
    this._detalle, 
    this._autor, 
    this._solucion,
    this._isExpanded,
    this._isSelec
  );

  static ModelUpload porDefecto(PlatformFile file) => ModelUpload(
    file,
    null,
    null,
    null,
    null,
    null,
    null,
    false,
    false,
    false
  );
  
  ModelUpload.map(dynamic obj){
    this._archivo    = obj['archivo'];
    this._nombre     = obj['nombre'];
    this._asignatura = obj['asignatura'];
    this._year       = obj['year'];
    this._detalle    = obj['detalle'];
    this._autor      = obj['autor'];
    this._solucion   = obj['solucion'];
    this._isExpanded = obj['isExpanded'];
    this._isSelec    = obj['isSelec'];
  }

  PlatformFile get archivo => _archivo;
  String get id            => _id;
  String get nombre        => _nombre;
  String get asignatura    => _asignatura;
  String get year          => _year;
  String get detalle       => _detalle;
  String get autor         => _autor;
  bool   get solucion      => _solucion;
  bool   get isExpanded    => _isExpanded;
  bool   get isSelec       => _isSelec;

  set archivo(archivo)       => _archivo = archivo;
  set nombre(nombre)         => _nombre = nombre;
  set asignatura(asignatura) => _asignatura = asignatura;
  set year(year)             => _year = year;
  set detalle(detalle)       => _detalle = detalle;
  set autor(autor)           => _autor = autor;
  set solucion(solucion)     => _solucion = solucion;
  set isExpanded(isExpanded) => _isExpanded = isExpanded;
  set isSelec(isSelec)       => _isSelec = isSelec;
}
