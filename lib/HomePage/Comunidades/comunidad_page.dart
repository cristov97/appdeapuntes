import 'package:appuntes/Modelos/Modelo_notificacion.dart';
import 'package:appuntes/Widgets/compartirRecursosFormWidget.dart';
import 'package:flutter/material.dart';

import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import 'package:appuntes/Otros/validaciones.dart';
import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Upload/upload_page.dart';
import 'package:appuntes/ListaDeArchivos/ui_archivos.dart';

import 'personalizar_comunidad.dart';

class ComunidadPage extends StatelessWidget{

  final Comunidad comunidad;

  ComunidadPage({
    this.comunidad
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            backgroundColor: comunidad.color,
            actions: comunidad.secciones.length > 30? [
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
                color: comunidad.color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      comunidad.nombre,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 23)
                    ),

                    Row(
                      children: [

                        Expanded(
                          flex: 2,
                          child: Text(
                            '${comunidad.secciones.length} secciones',
                            style: TextStyle(fontSize: 18, color: Colors.white)
                          ) 
                        ),

                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white), 
                          onPressed: () => showDialog<Seccion>(
                            context: context,
                            builder: (context) => CrearSeccion(
                              comunidad.nombre,
                              comunidad.secciones
                            )
                          )
                          .then((seccion) => seccion != null? (comunidad.secciones.add(seccion)) : null)
                        ),

                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white), 
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => OpcionesComunidad(comunidad: comunidad)
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
                    title: Text(comunidad.secciones[i].titulo),
                    subtitle: Text('Contiene ${comunidad.secciones[i].archivos.length} apuntes'),
                    onTap: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => UiSeccion(
                          tituloComunidad : comunidad.nombre,
                          tituloSeccion   : comunidad.secciones[i].titulo,
                          color           : comunidad.color,
                          archivos        : comunidad.secciones[i].archivos,
                        )
                      )
                    )
                  ),

                  Divider(color: Colors.black26)
                ]
              ),

              childCount: comunidad.secciones.length,

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

  final Comunidad comunidad;

  OpcionesComunidad({
   this.comunidad
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
                  tituloComunidad : comunidad.nombre,
                  descripcion     : comunidad.descripcion,
                  color           : comunidad.color,
                  imagen          : comunidad.imagen,
                  publico         : comunidad.publico
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
                builder: (context) => CompartirRecurso(
                  tituloDialogo : 'Invitar',
                  comunidad     : comunidad,
                  notificacion  : Notificar.invitacion
                )
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
