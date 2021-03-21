import 'package:appuntes/HomePage/Comunidades/lista_comunidades.dart';

import 'Modelo_archivos.dart';
import 'asignaturas.dart';

class Validar{

  static String numUpload(String valor){
    bool regExp1 = RegExp(r'(\b[1-9]\d\d\b|\b[1-9]\d\b|\b[1-9]{1}\b)').hasMatch(valor);
    bool regExp2 = RegExp(r'([.-]|\d\s\d|\s\d\d|\d\d\s)').hasMatch(valor);

    if (!regExp1 || regExp2){
      return 'No válido';
    }  
    return null;
  }

  String year(String valor){
    bool regExp = RegExp(r'(\b[1-2]\d\d\d\b)').hasMatch(valor);

    if (!valor.contains('')){
      if(!regExp || (int.parse(valor) > DateTime.now().year)){
        return 'Ingresa un año válido.';
      }
    }
    return null;
  }

  static String asigUpload(String valor){
    if (valor.isEmpty) return 'Llenar.';
    
    if (!Asignaturas().listaAsig.contains(valor)) return 'No válido';
    
    return null;
  }

  String llenado(String valor){
    if (valor.isEmpty){
      return 'Llena este espacio.';
    }
    else{
      return null;
    }
  }

  String tituloSeccion(String titulo, List<Seccion> secciones){

    Iterable<Seccion> repetidos = secciones.where((item) => item.titulo == titulo);

    if (titulo.isEmpty) return 'Crear un título para tu sección';
    if (repetidos.length != 0) return 'Ya existe una sección con este nombre';
    return null;
  }

  String limpiarTexto(String texto) {
    texto = texto.replaceAll("_", " ");
    texto = texto.replaceAll("-", " ");
    if (texto.contains('.') && texto.indexOf('.') != (texto.length)) {
      texto = texto.replaceRange(texto.lastIndexOf('.'), texto.length, '');
    }
    return texto;
  }

  static String correo(String value){
    bool regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    if(!regExp){
      return 'Introduce un correo válido.';
    }

    return null;
  }

  bool completarDatos(List<ModeloArchivo> datos){
    Iterable<ModeloArchivo> incompletos = datos.where(
      (item) => item.nombre == null || item.asignatura == null
    );

    if (incompletos.length != 0) return true;
    else return false;
  }
}

final validar = Validar();