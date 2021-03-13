import 'package:flutter/material.dart';

class Recientes extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_ArchivosRec();
}
class _ArchivosRec extends State<Recientes>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  
        children: [
          Container(
            child: Text('Recientes')
          ),
        ]
      )
    );
  }
}
