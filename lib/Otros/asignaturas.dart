import 'package:diacritic/diacritic.dart';

class Asignaturas{

  List<String> listaAsig = [
    'FUNDAMENTOS DE MATEMÁTICA',
    'ÁLGEBRA',
    'INTRODUCCIÓN A LA INGENIERÍA INDUSTRIAL',
    'INFORMÁTICA I',
    'DESARROLLO PERSONAL',

    'CÁLCULO DIFERENCIAL',
    'ÁLGEBRA LINEAL',
    'FUNDAMENTOS DE FÍSICA',
    'MUNDO CONTEMPORÁNEO Y DESAFÍOS DE DE LA INGENIERÍA',
    'DESARROLLO PERSONAL II',
    'IDIOMA I',

    'CÁLCULO INTEGRAL Y SERIES',
    'QUÍMICA GENERAL',
    'FÍSICA MECÁNICA',
    'ADMINISTRACIÓN Y SISTEMAS ORGANIZACIONALES',
    'TALLER DE CREATIVIDAD Y EMPRENDIMIENTO',
    'IDIOMA II',

    'CÁLCULO EN VARIAS VARIABLES',
    'ECUACIONES DIFERENCIALES',
    'FÍSICA CALOR, ONDAS Y ÓPTICA',
    'INFORMÁTICA II',
    'IDIOMA III',

    'ESTADÍSTICA Y PROBABILIDADES',
    'CONTABILIDAD FINANCIERA',
    'FÍSICA ELECTROMAGNETISMO',
    'CIENCIA Y TECNOLOGÍA DE LOS MATERIALES',
    'TALLER DE INTEGRACIÓN DE INGENIERÍA INDUSTRIAL I',
    'TIPE SELLO UV I',

    'INFERENCIA ESTADÍSTICA',
    'COSTOS Y PRESUPUESTOS',
    'TERMODINÁMICA DE PROCESOS',
    'SISTEMAS DE INFORMACIÓN Y BASES DE DATOS',
    'MICROECONOMÍA',
    'TIPE SELLO UV II',

    'MODELAMIENTO',
    'ANÁLISIS Y ESTRATEGIA  DE NEGOCIOS',
    'MECÁNICA DE FLUÍDOS',
    'TECNOLOGÍAS DE INFORMACIÓN E INTELIGENCIA DE NEGOCIOS',
    'MACROECONOMÍA',
    'TIPE SELLO UV III',

    'INVESTIGACIÓN DE OPERACIONES',
    'GESTIÓN DE OPERACIONES I',
    'MARCO LEGAL DE LAS ORGANIZACIONES',
    'PROCESOS INDUSTRIALES',
    'GESTIÓN DE LA INNOVACIÓN',
    'TALLER DE INTEGRACIÓN DE INGENIERÍA INDUSTRIAL II',

    'GESTIÓN DE RIESGOS',
    'GESTIÓN DE OPERACIONES II',
    'GESTIÓN DE RECURSOS HUMANOS',
    'AUTOMATIZACIÓN Y CONTROL DE PROCESOS',
    'FINANZAS I',
    'MARKETING ESTRATÉGICO',
    'ELECTIVO',

    'DIRECCIÓN ESTRATÉGICA',
    'EVALUACIÓN Y GESTIÓN DE PROYECTOS Y PROGRAMAS',
    'GESTIÓN ENERGÉTICA',
    'FINANZAS II',

    'TALLER DE INTEGRACIÓN DE INGENIERÍA INDUSTRIAL III'
  ];
}

class SuggestionsAsig {
  static Future<List> getSuggestions(String query) async {
    List<String> _queryList = Asignaturas().listaAsig.where(
      (element) => (
        (removeDiacritics(element)).contains(query.toUpperCase())
        )
    ).toList();

    return List.generate(_queryList.length, (index) => _queryList[index]);
  } 
}

/* Widget _textAheadFieldAsig() {
      return TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          controller: asigControl,
          decoration: InputDecoration(
            hintText: 'Ingrese asignatura',
            contentPadding: EdgeInsets.all(20),
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => asigControl.clear(),   
            ),
            border: _outlineInputBorder,
            errorText: Validar.asigUpload(asigControl.text)
          ),
          focusNode: asigFocus,
          onEditingComplete: () => cambiarFocus(descFocus),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
        suggestionsCallback: (pattern) async {
          return await SuggestionsAsig.getSuggestions(pattern);
        },
        suggestionsBoxDecoration: _suggestionsBoxDecoration,
        suggestionsBoxVerticalOffset: -5,
        hideSuggestionsOnKeyboardHide: true,
        itemBuilder: (context, itemAsig) {
          return ListTile(
            leading: Icon(Icons.school, color: Colors.blue),
            title: Text(itemAsig),
          );
        },
        noItemsFoundBuilder: (context) => Text('No encontrado.'),
        onSuggestionSelected: (suggestion) {
          setState(() => asigControl.text = suggestion);
          cambiarFocus(descFocus);
        },
      );
    }*/