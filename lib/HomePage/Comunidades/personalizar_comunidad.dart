import 'dart:io';

import 'package:flutter/material.dart';

import 'package:appuntes/Upload/selecionar_archivos.dart';
import 'package:appuntes/Widgets/optionListTileWidget.dart';

class PersonalizarComunidad extends StatefulWidget {

  final String tituloComunidad;
  final String descripcion;
  final Color color;
  final bool publico;
  final String imagen;

  PersonalizarComunidad({
    this.tituloComunidad,
    this.descripcion,
    this.color,
    this.imagen,
    this.publico
  });

  @override
  _PersonalizarComunidadState createState() => _PersonalizarComunidadState();
}

class _PersonalizarComunidadState extends State<PersonalizarComunidad> {

  TextEditingController descripcion;
  TextEditingController nombre; 
  FocusNode descripcionFocus;
  FocusNode nombreFocus;

  Map<Color, String> coloresDisponibles = {
    Colors.blue[700]    : 'Azul',
    Colors.yellow[800]  : 'Amarillo',
    Colors.red          : 'Rojo',
    Colors.green        : 'Verde',
    Colors.pink         : 'Rosado',
    Colors.purple       : 'Púrpura',
    Colors.indigoAccent : 'Indigo',
    Colors.orange       : 'Naranjo'
  };

  @override
  void initState() { 
    super.initState();
    descripcion      = TextEditingController(text: widget.descripcion);
    nombre           = TextEditingController(text: widget.tituloComunidad);
    descripcionFocus = FocusNode();
    nombreFocus      = FocusNode();
  }

  @override
  void dispose() {
    descripcion.dispose();
    nombre.dispose();

    descripcionFocus.dispose();
    nombreFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color == null? Theme.of(context).primaryColor : widget.color,
        title: Text('Personalizar comunidad'),
        centerTitle: true
      ),

      body: ListView(
        padding: EdgeInsets.only(top: 15),
        children: [

          ListTile(
            leading: Container(
              width: 70, height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: widget.imagen == null? null: DecorationImage(
                  image: NetworkImage(widget.imagen),
                  fit: BoxFit.fill
                )
              ),
              child: Icon(Icons.photo, color: Colors.white)
            ),
            title: Text('Logo/imagen de la comunidad'),
            onTap: () => showDialog(
              context: context,
              builder: (context) => SeleccionarImagen(networkImage: widget.imagen)
            )
          ),

          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Nombre de la comunidad'),
            subtitle: Text(widget.tituloComunidad),
            onTap: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                titlePadding: EdgeInsets.symmetric(vertical: 20),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                title: Text(
                  'Nombre de la comunidad',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  )
                ),

                children: [
                  TextField(
                    controller: nombre,
                    focusNode: nombreFocus,
                    minLines: 1, maxLines: 3,
                    maxLength: 80,
                    decoration: InputDecoration(
                      icon: Icon(Icons.group),
                      hintText: 'Crea un nombre...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    onEditingComplete: () => nombreFocus.unfocus(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () => Navigator.pop(context)
                      ),

                      TextButton(
                        child: Text('Guardar'),
                        onPressed: (){}, 
                      )
                    ]
                  )
                ]
              )
            )
          ),

          OptionListTile(
            leading: Icon(widget.publico == true? Icons.lock_open : Icons.lock),
            title: 'Acceso',
            subtitle: widget.publico == true? 'Público' : 'Privado',
            opciones: ['Público', 'Privado'],
            keyOpciones: [true, false],
            group: widget.publico 
          ),

          OptionListTile(
            leading: Container(
              width: 30,
              height: 30,
              color: widget.color
            ),
            title: 'Color representativo',
            subtitle: coloresDisponibles[widget.color],
            opciones: ['Azul', 'Amarillo', 'Rojo', 'Verde', 'Rosado', 'Púrpura', 'Indigo', 'Naranja'],
            keyOpciones: [
              Colors.blue[700],
              Colors.yellow[800],
              Colors.red,
              Colors.green,
              Colors.pink,
              Colors.purple ,
              Colors.indigoAccent,
              Colors.orange
            ],
            group: widget.color
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: descripcion,
              focusNode: descripcionFocus,
              minLines: 1,
              maxLines: 10,
              maxLength: 200,
              decoration: InputDecoration(
                icon: Icon(Icons.text_fields),
                labelText: 'Descripción',
                hintText: '¿Quiénes son? y ¿qué compartirán?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              onEditingComplete: () => descripcionFocus.unfocus(),
            ),
          )
        ]
      )
    );
  }
}

class SeleccionarImagen extends StatefulWidget{
  final String networkImage;

  SeleccionarImagen({
    this.networkImage
  });

  @override
  _SeleccionarImagenState createState() => _SeleccionarImagenState();
}

class _SeleccionarImagenState extends State<SeleccionarImagen> {

  File nuevaImagen;
  bool fondo = false;//revisar

  ImageProvider get imagenWidget{

    if(widget.networkImage != null && nuevaImagen == null) return NetworkImage(widget.networkImage);
    
    if(nuevaImagen != null) return FileImage(nuevaImagen);

    return AssetImage('assets/images/not_photo.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      children: [
        Container(
          width: 130, height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imagenWidget,
              fit: BoxFit.fill
            )
          )
        ),

        Row(
          children: [
            Text('Usar como fondo'),
            Checkbox(
              value: fondo,
              activeColor: Colors.blue,
              onChanged: (value) => setState(() => fondo = value)
            ),
          ]
        ),

        TextButton(
          child: Text('Seleccionar imagen'),
          onPressed: () => filePicker.seleccionImagen.then(
            (value) => setState(() => nuevaImagen = File(value.files.single.path))
          )
        ),

        TextButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.pop(context)
        )
      ]
    );
  }
}