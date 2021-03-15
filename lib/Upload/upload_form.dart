import 'package:flutter/material.dart';

import 'package:appuntes/Otros/validaciones.dart';
import 'selecionar_archivos.dart';

class UploadForm extends StatefulWidget{
  final BuildContext context;
  final ModelUpload datos;
  final bool editarVarios;

  UploadForm({
    this.context,
    this.datos, 
    this.editarVarios = false
  });

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nombre;
  TextEditingController asignatura;
  TextEditingController year;
  TextEditingController autor;
  TextEditingController detalles;
  
  FocusNode nombreFocus;
  FocusNode asignaturaFocus;
  FocusNode yearFocus;
  FocusNode autorFocus;
  FocusNode detallesFocus;

  @override
  void initState() { 
    super.initState();

    if(widget.editarVarios == false){
      nombre = TextEditingController(text: widget.datos.nombre);
      nombreFocus = FocusNode();
    }
    
    asignatura = TextEditingController(text: widget.datos.asignatura);
    year       = TextEditingController(text: widget.datos.year);
    autor      = TextEditingController(text: widget.datos.autor);
    detalles   = TextEditingController(text: widget.datos.detalle);
    
    asignaturaFocus = FocusNode();
    yearFocus       = FocusNode();
    autorFocus      = FocusNode();
    detallesFocus   = FocusNode();
    
  }

  @override
    void dispose() {
      super.dispose();
      
      if(widget.editarVarios == false){
        nombre.dispose();
        nombreFocus.dispose();
      }

      asignatura.dispose();
      year.dispose();
      autor.dispose();
      detalles.dispose();

      asignaturaFocus.dispose();
      yearFocus.dispose();
      autorFocus.dispose();
      detallesFocus.dispose();
    }

  @override
  Widget build(BuildContext context) {

    final pegarNombre = TextButton(
      child: Row(
        children:[
          Icon(Icons.paste, size: 15),

          SizedBox(width: 5),
          
          Text('Pegar nombre por defecto')
        ]
      ),

      onPressed: (){ 
        nombre.text = widget.datos.archivo.name.replaceAll(
          '.${widget.datos.archivo.extension}', ''
        );
        widget.datos.nombre = nombre.text;
      }
    );

    final Function guardar = () {
      if(formKey.currentState.validate()) {
        formKey.currentState.save();
        filePicker.modificado = true;
        Navigator.pop(widget.context, true);
      }
    };
  
    return SimpleDialog(
      contentPadding: EdgeInsets.all(10),
      children:[
        widget.editarVarios == false
        ? pegarNombre
        : Text('Editar archivos seleccionados:'),

        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              widget.editarVarios == false?

              TextFormField(
                controller: nombre,
                focusNode: nombreFocus,
                keyboardType: TextInputType.text,
                minLines: 1, maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                validator: (value) => validar.llenado(value),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Crea un nombre para tu documento...',
                ),
                onEditingComplete: () => FocusScope.of(widget.context).requestFocus(asignaturaFocus),
                onSaved: (value) => widget.datos.nombre = value,
              ) : SizedBox(),

              TextFormField(
                controller: asignatura,
                focusNode: asignaturaFocus,
                keyboardType: TextInputType.text,
                minLines: 1, maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                validator: widget.editarVarios == false? (value) => validar.llenado(value) : null,
                decoration: InputDecoration(
                  labelText: 'Asignatura',
                  hintText: 'Ingresa asignatura/area'
                ),
                onEditingComplete: () => FocusScope.of(widget.context).requestFocus(autorFocus),
                onSaved: (value) => widget.datos.asignatura = value,
              ),

              TextFormField(
                controller: autor,
                focusNode: autorFocus,
                keyboardType: TextInputType.text,
                minLines: 1, maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Autor/institución',
                  hintText: 'Ingresa autor/institución...'
                ),
                onEditingComplete: () => FocusScope.of(widget.context).requestFocus(yearFocus),
                onSaved: (value) => widget.datos.autor = value,
              ),

              TextFormField(
                controller: year,
                focusNode: yearFocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) => validar.year(value),
                decoration: InputDecoration(
                  labelText: 'Año',
                  hintText: 'Ingresa año...'
                ),
                onSaved: (value) => widget.datos.year = value,
                onEditingComplete: () => FocusScope.of(widget.context).requestFocus(detallesFocus),
              ),
              
              TextFormField(
                controller: detalles,
                focusNode: detallesFocus,
                keyboardType: TextInputType.text,
                minLines: 1, maxLines: 10,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Detalles',
                  hintText: 'Otra información...'
                ),
                onSaved: (value) => widget.datos.detalle = value,
                onEditingComplete: () => detallesFocus.unfocus(),
              )
            ]
          )
        ),
        
        Row(
          children: [
            Text('Contiene solucionario/pauta.'),
            Checkbox(
              value: widget.datos.solucion,
              activeColor: Colors.blue,
              onChanged: (value) => setState(() => widget.datos.solucion = value)
            ),
          ]
        ),
        
        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: guardar,
          child: Text('Guardar')
        )
      ]
    );
  }
}