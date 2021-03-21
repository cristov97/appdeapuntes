import 'package:flutter/material.dart';

class OptionListTile extends StatelessWidget{
  final Widget leading;
  final String title;
  final String subtitle;
  final List<String> opciones;
  final List<dynamic> keyOpciones;
  final dynamic group;
  final Function(dynamic, String) changes;

  OptionListTile({
    this.leading,
    this.title,
    this.subtitle,
    this.opciones,
    this.keyOpciones,
    this.group, 
    this.changes
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: (){
        showDialog(
          context: context,
          builder: (dialogContext) => SimpleDialog(
            children: List.generate(
              opciones.length,
              (index) => items(
                dialogContext,
                opciones[index],
                keyOpciones[index],
                group               
              )
            )  
          )
        );
      }
    );
  }

  Widget items(BuildContext context, String text, dynamic value, dynamic group){
    return RadioListTile<dynamic>(
      title: Text(text),
      value: value,
      groupValue: group,
      onChanged: (dynamic selec) {
        changes(selec, text);
        Navigator.pop(context);
      }
    );
  }
}