import 'package:file_picker/file_picker.dart';

class ModeloArchivo{
  PlatformFile _archivo;
  String _id;
  String _nombre;
  String _asignatura;
  String _year;
  String _detalle;
  String _autor;
  String _extension;
  bool _solucion;
  bool _isExpanded;
  bool _isSelec;
  int _likes = 0;

  ModeloArchivo(
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

  ModeloArchivo.mostrar({
    String nombre,
    String asignatura,
    String year,
    String detalle, 
    String autor, 
    String extension,
    bool   solucion,
    int    likes
  })  
  {
    this._nombre     = nombre;
    this._asignatura = asignatura;
    this._year       = year;
    this._detalle    = detalle;
    this._autor      = autor; 
    this._extension  = extension; //no es necesario 
    this._solucion   = solucion;
    this._likes      = likes;
  }

  static ModeloArchivo porDefecto(PlatformFile file) => ModeloArchivo(
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
  
  ModeloArchivo.map(dynamic obj){
    this._archivo    = obj['archivo'];
    this._nombre     = obj['nombre'];
    this._asignatura = obj['asignatura'];
    this._year       = obj['year'];
    this._detalle    = obj['detalle'];
    this._autor      = obj['autor'];
    this._solucion   = obj['solucion'];
    this._likes      = obj['likes'];
  }

  PlatformFile get archivo    => _archivo;
  String       get id         => _id;
  String       get nombre     => _nombre;
  String       get asignatura => _asignatura;
  String       get year       => _year;
  String       get detalle    => _detalle;
  String       get autor      => _autor;
  //String       get extension  => _archivo.extension;
  String       get extension  => _extension;
  bool         get solucion   => _solucion;
  bool         get isExpanded => _isExpanded;
  bool         get isSelec    => _isSelec;
  int          get likes      => _likes;

  set archivo(archivo)       => _archivo    = archivo;
  set nombre(nombre)         => _nombre     = nombre;
  set asignatura(asignatura) => _asignatura = asignatura;
  set year(year)             => _year       = year;
  set detalle(detalle)       => _detalle    = detalle;
  set autor(autor)           => _autor      = autor;
  set solucion(solucion)     => _solucion   = solucion;
  set isExpanded(isExpanded) => _isExpanded = isExpanded;
  set isSelec(isSelec)       => _isSelec    = isSelec;
}