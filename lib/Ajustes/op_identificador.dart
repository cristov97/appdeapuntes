import 'ajustes_page.dart';

enum Identificador{
  inicial,
  archExtension
}

class OpIdentificador implements Options{
  
  static String textOption;
  static dynamic option;

  List<String> options = [
    'Letra inicial del nombre.',
    'Tipo de archivo o extension (pdf, ppt, excel).'
  ];

  Map<String, dynamic> get porDefecto{
    return {
      'textOption': options[0], 
      'option': Identificador.values[0]
    };
  }

  get groupValue{
    if(option == null){
      return porDefecto['option']; 
    }
    else{
      return option;
    }
  }

  String get subtitle{
    if(option == null){
      return porDefecto['textOption']; 
    }
    else{
      return textOption;
    }
  }

  double get fontSize{
    if(option == Identificador.inicial){
      return 20;
    }
    else if(option == Identificador.archExtension){
      return 15;
    }
    else{
      return null;
    }
  } 

}


