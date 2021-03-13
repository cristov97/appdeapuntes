import 'package:flutter/material.dart';

class Report extends StatefulWidget{
  final String fileName;

  Report(this.fileName);

  @override
  State<StatefulWidget> createState() => _ReportState();
}

enum ReportOption{
  archVacio,
  archError,
  contInade,
  otro
}

class _ReportState extends State<Report>{

  ReportOption groupOption;

  @override
  Widget build(BuildContext context) {

    Widget radioListTile(ReportOption option, String title){
      return RadioListTile<ReportOption>(
        value: option,
        groupValue: groupOption,
        onChanged: (selecOption){
          setState(() => groupOption = selecOption);
        },
        title: Text(title),
      );
    }

    Widget textFieldReport(ReportOption groupOption){
      if(groupOption == ReportOption.otro){
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Especifíca el problema...'
            ),
            minLines: 1,
            maxLines: 10,
          )             
        );
      }
      else{
        return SizedBox(height: 5);
      }
    }

    return SimpleDialog(
      title: Center(child: Text('Reportar')),
      titlePadding: EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 15),
      children: [
        Column(
          children: [
            radioListTile(
              ReportOption.archVacio,
              'El archivo no tiene contenido o es ilegible.'
            ),
            radioListTile(
              ReportOption.archError,
              'El archivo no se puede abrir.'
            ),
            radioListTile(
              ReportOption.contInade,
              'Contenido inadecuado.'
            ),
            radioListTile(
              ReportOption.otro,
              'Otro'
            ),
            textFieldReport(groupOption),

            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Enviar'),
              onPressed: (){

              }
            )
          ]
        )
      ] 
    );
  }
}

