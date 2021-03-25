import 'dart:io';

import 'package:flutter/material.dart';

import 'package:appuntes/Upload/selecionar_archivos.dart';
import 'package:appuntes/Widgets/optionListTileWidget.dart';

class PersonalizarComunidad extends StatefulWidget {

  final String tituloComunidad;
  final String descripcion;
  final Color color;
  final bool publico;
  final bool nuevaComunidad;
  final String imagen;

  PersonalizarComunidad({
    this.tituloComunidad,
    this.descripcion,
    this.color,
    this.imagen,
    this.publico,
    this.nuevaComunidad
  });

  @override
  _PersonalizarComunidadState createState() => _PersonalizarComunidadState();
}

class _PersonalizarComunidadState extends State<PersonalizarComunidad> {

  TextEditingController descripcion;
  TextEditingController nombre; 
  FocusNode descripcionFocus;
  FocusNode nombreFocus;
  bool publico = true; //solo de prueba
  Color groupColor;

  Map<Color, String> coloresDisponibles = {
    Colors.blue[700]    : 'Azul',
    Colors.yellow       : 'Amarillo',
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

    groupColor = widget.color?? Colors.blue[700];
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
        backgroundColor: widget.color?? Theme.of(context).primaryColor,
        title: Text(widget.nuevaComunidad == true? 'Crear comunidad' : 'Personalizar comunidad'),
        centerTitle: widget.nuevaComunidad == true? false : true,
        actions: widget.nuevaComunidad == true? [
          TextButton(
            child: Text('Listo', style: TextStyle(color: Colors.white)),
            onPressed: (){},
          )
        ] : null
      ),

      body: ListView(
        children: [
          
          SeleccionarImagen(networkImage: widget.imagen),

          Divider(height: 5, thickness: 10),

          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Nombre de la comunidad'),
            subtitle: Text(widget.tituloComunidad?? 'Crea un nombre'),
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

          ListTile(
            leading: Icon(publico == true? Icons.lock_open : Icons.lock),
            title: Text('Acceso'),
            subtitle: Text(publico == true? 'Público' : 'Privado'),
            trailing: Switch.adaptive(
              value: publico, 
              onChanged: (value) => setState(() => publico = value)
            )
          ),

          OptionListTile(
            leading: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: groupColor,
                borderRadius: BorderRadius.circular(15)
              )
            ),
            title: 'Color representativo',
            subtitle: coloresDisponibles[groupColor],
            opciones: ['Azul', 'Amarillo', 'Rojo', 'Verde', 'Rosado', 'Púrpura', 'Indigo', 'Naranja'],
            keyOpciones: [
              Colors.blue[700],
              Colors.yellow,
              Colors.red,
              Colors.green,
              Colors.pink,
              Colors.purple ,
              Colors.indigoAccent,
              Colors.orange
            ],
            group: groupColor,
            onChanged: (color) {
              setState(() => groupColor = color);
              Navigator.pop(context);
            }
          ),

          Divider(height: 5, thickness: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
  bool enPortada = false;//revisar

  ImageProvider get imagenWidget{

    if(widget.networkImage != null && nuevaImagen == null) return NetworkImage(widget.networkImage);
    
    if(nuevaImagen != null) return FileImage(nuevaImagen);

    return AssetImage('assets/images/not_photo.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.image),
          title: Text('Imagen/logo')
        ),

        Container(
          width: (MediaQuery.of(context).size.width - 70),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imagenWidget,
              fit: BoxFit.cover
            )
          )
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Seleccionar '),
              onPressed: () => filePicker.seleccionImagen.then(
                (value) => setState(() => nuevaImagen = File(value.files.single.path))
              )
            ),

            nuevaImagen != null? TextButton(
              child: Text('Descartar'),
              onPressed: () => setState(() => nuevaImagen = null)
            ) : SizedBox()

          ]
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Usar en la portada'),
            Checkbox(
              value: enPortada,
              activeColor: Colors.blue,
              onChanged: (value) => setState(() => enPortada = value)
            ),
            SizedBox(width: 25)
          ]
        )
       
      ]
    );
  }
}