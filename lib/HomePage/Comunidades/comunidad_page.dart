import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import 'package:appuntes/Otros/validaciones.dart';
import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Upload/upload_page.dart';
import 'package:appuntes/ListaDeArchivos/ui_archivos.dart';

import 'personalizar_comunidad.dart';

class ComunidadPage extends StatelessWidget{

  final String tituloComunidad;
  final String descripcion;
  final Color color;
  final int cantidad;
  final bool publico;
  final String imagen;
  final List<Seccion> secciones; 

  ComunidadPage({
    this.tituloComunidad,
    this.descripcion,
    this.color,
    this.cantidad,
    this.publico,
    this.imagen,
    this.secciones
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            backgroundColor: color,
            actions: secciones.length > 30? [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {}
              )
            ] : null
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              maxHeight: MediaQuery.of(context).size.height * 0.3,
              minHeight: MediaQuery.of(context).size.height * 0.11,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10
                ),
                color: color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      tituloComunidad,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 23)
                    ),

                    Row(
                      children: [

                        Expanded(
                          flex: 2,
                          child: Text(
                            '${secciones.length} secciones',
                            style: TextStyle(fontSize: 18, color: Colors.white)
                          ) 
                        ),

                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white), 
                          onPressed: () => showDialog<Seccion>(
                            context: context,
                            builder: (context) => CrearSeccion(
                              tituloComunidad,
                              secciones
                            )
                          )
                          .then((seccion) => seccion != null? (secciones.add(seccion)) : null)
                        ),

                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white), 
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => OpcionesComunidad(
                              tituloComunidad : tituloComunidad,
                              descripcion     : descripcion,
                              color           : color,
                              imagen          : imagen,
                              publico         : publico
                            )
                          )
                        )

                      ]
                    )

                  ]
                )
              )
            )
          ),
         
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Column(
                children: [

                  ListTile(
                    title: Text(secciones[i].titulo),
                    subtitle: Text('Contiene ${secciones[i].archivos.length} apuntes'),
                    onTap: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => UiSeccion(
                          tituloComunidad : tituloComunidad,
                          tituloSeccion   : secciones[i].titulo,
                          color           : color,
                          archivos        : secciones[i].archivos,
                        )
                      )
                    )
                  ),

                  Divider(color: Colors.black26)
                ]
              ),

              childCount: secciones.length,

            )
          )
        ]
      )  
    ); 
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate{
  final Widget child;
  final double maxHeight;
  final double minHeight;

  PersistentHeader({
    this.child,
    this.maxHeight,
    this.minHeight
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return (maxHeight != oldDelegate.maxExtent || minHeight != oldDelegate.minExtent); 
  }
}

class OpcionesComunidad extends StatelessWidget{

  final String tituloComunidad;
  final String descripcion;
  final Color color;
  final bool publico;
  final String imagen;

  OpcionesComunidad({
    this.tituloComunidad,
    this.descripcion,
    this.color,
    this.imagen,
    this.publico
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          ListTile(
            leading: Icon(Icons.color_lens, color: Colors.black45),
            title: Text('Personalizar grupo'),
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => PersonalizarComunidad(
                  tituloComunidad : tituloComunidad,
                  descripcion     : descripcion,
                  color           : color,
                  imagen          : imagen,
                  publico         : publico
                )
              )
            )
          ),

          ListTile(
            leading: Icon(Icons.person_add, color: Colors.black45),
            title: Text('Enviar invitación'),
            onTap: () {
              Navigator.pop(context);
              showDialog<bool>(
                context: context,
                builder: (context) => Invitacion()
              )
              .then((value){ 
                if(value == true) ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red[900],
                    content: Text('La invitación fue enviada.')
                  )
                );
              });
            }
          ),

          ListTile(
            leading: Icon(Icons.table_rows, color: Colors.black45),
            title: Text('Modificar secciones'),
          )

        ]
      )
    );
  }
}

class CrearSeccion extends StatefulWidget{

  final String tituloComunidad;
  final List<Seccion> secciones;

  CrearSeccion(
    this.tituloComunidad,
    this.secciones
  );

  @override
  _CrearSeccionState createState() => _CrearSeccionState();
}

class _CrearSeccionState extends State<CrearSeccion> {
  TextEditingController tituloSeccion = TextEditingController();
  FocusNode             tituloSeccionFocus;
  Seccion               nuevaSeccion;
  GlobalKey<FormState>  formKey;

  @override
  void initState() { 
    super.initState();
    tituloSeccionFocus = FocusNode();
    nuevaSeccion       = Seccion(archivos: []);
    formKey            = GlobalKey<FormState>();
  }

  @override
  void dispose() { 
    tituloSeccion.dispose();
    tituloSeccionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding : EdgeInsets.only(right: 15, left: 10, bottom: 10),
      title          : Text('Crea una sección', textAlign: TextAlign.center),
      children       : [
        Form(
          key: formKey,
          child: TextFormField(
            controller: tituloSeccion,
            focusNode: tituloSeccionFocus,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              icon: Icon(Icons.text_fields, color: Colors.black54),
              labelText: 'Título de la sección',
              helperText: 'Procura que el título sea claro y específico.',
              helperMaxLines: 2,
              errorMaxLines: 2
            ),
            validator: (value) => validar.tituloSeccion(value, widget.secciones),
            onChanged: (value) => nuevaSeccion.titulo = value,
            onEditingComplete: () => tituloSeccionFocus.unfocus(),
            onSaved: (value) => nuevaSeccion.titulo = value,
          )
        ),
      
        SizedBox(height: 10),

        TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black54))
          ),
          child: Row(
            children: [

              Icon( Icons.add_box),

              SizedBox(width: 5),

              Text('Agregar archivos a la sección')
            ]
          ),

          onPressed: () {
            Navigator.push<List<ModeloArchivo>>(
              context, 
              MaterialPageRoute(builder: (context) => UploadPage(
                archivos : nuevaSeccion.archivos,
                ruta     : '${widget.tituloComunidad}'
                )
              )
            )
            .then(
              (archivos) => setState(() { 
                if (archivos != null) nuevaSeccion.archivos = archivos;
              })
            );
          }
        ),

        nuevaSeccion.archivos.isEmpty? SizedBox() : Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
              nuevaSeccion.archivos.length, 
              (i) => Text(
                '${i+1}. ${nuevaSeccion.archivos[i].nombre}',
                overflow  : TextOverflow.ellipsis,
                textAlign : TextAlign.start,
              )
            )
          ),
        ),

        TextButton(
          child: Text('Añadir sección'),
          onPressed: () {
            if(formKey.currentState.validate()) {
              formKey.currentState.save();
              Navigator.pop(context, nuevaSeccion);
            }
          }
        )

      ]
    );
  }
}

class UiSeccion extends StatelessWidget {

  final String tituloComunidad;
  final String tituloSeccion;
  final List<ModeloArchivo> archivos;
  final Color color;

  UiSeccion({
    this.tituloComunidad,
    this.tituloSeccion,
    this.archivos,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor : color,
        title           : Text(tituloSeccion, overflow: TextOverflow.ellipsis),
        actions         : [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadPage(
                    ruta: '$tituloComunidad/$tituloSeccion'
                  )
                )
              );
            }
          )
        ]
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: archivos.length,
        itemBuilder: (context, i) => UiArchivo(
          nombre       : archivos[i].nombre,
          year         : archivos[i].year,
          asignatura   : archivos[i].asignatura,
          autor        : archivos[i].autor,
          solucion     : archivos[i].solucion,
          likes        : archivos[i].likes,
          extension    : archivos[i].extension
        )
      )   
    );
  }
}

class Invitacion extends StatefulWidget{
  final String comunidad;

  Invitacion({
    this.comunidad
  });

  @override
  State<StatefulWidget> createState() => InvitacionState();
}

class InvitacionState extends State<Invitacion>{

  TextEditingController controller;
  FocusNode focus;

  @override
  void initState() { 
    super.initState();

    controller = TextEditingController();
    focus      = FocusNode();
  }

  @override
  void dispose() {

    controller.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.all(15),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      title: Text(
        'Invitar',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
      ),
      children: [
        TextField(
          controller: controller,
          focusNode: focus,
          minLines: 1, maxLines: 2,
          decoration: InputDecoration(
            icon: Icon(Icons.send),
            hintText: 'Ingresa nick o correo',
          )
        ),

        SizedBox(height: 5),

        TextButton(
          child: Text(
            'Enviar', 
            textAlign: TextAlign.end, 
            style: TextStyle(fontSize: 16)
          ),
          onPressed: (){
            //TODO
            Navigator.pop(context, true);
          }
        )
      ]
    );
  }

}