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
    if (valor.isEmpty){
      return 'Llenar.';
    }
    if (!Asignaturas().listaAsig.contains(valor)){
      return 'No válido';
    }
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
}

final validar = Validar();