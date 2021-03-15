import 'package:flutter/material.dart';

import 'package:appuntes/ListaDeArchivos/lista_archivos.dart';
import 'package:appuntes/ListaDeArchivos/ui_archivos.dart';
import 'lista_comunidades.dart';

class ComunidadPage extends StatelessWidget{

  final String titulo;
  final String descripcion;
  final Color color;
  final int cantidad;
  final bool publico;
  final Image imagen;
  final List<Seccion> secciones; 

  ComunidadPage({
    this.titulo,
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
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){}
              )
            ]
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
                      titulo,
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
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => CrearSeccion()
                          )
                        ),

                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white), 
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => OpcionesComunidad()
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
                          titulo   : secciones[i].titulo,
                          color    : color,
                          archivos : secciones[i].archivos,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          ListTile(
            leading: Icon(Icons.settings, color: Colors.black45),
            title: Text('Personalizar grupo'),//desc, foto, color, nombre, privacidad
          ),

          ListTile(
            leading: Icon(Icons.person_add, color: Colors.black45),
            title: Text('Enviar invitación'),
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

class CrearSeccion extends StatelessWidget{

  final TextEditingController tituloSeccion = TextEditingController();
  final FocusNode tituloSeccionFocus = FocusNode();

  dispose(){
    tituloSeccion.dispose();
    tituloSeccionFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.only(right: 15, left: 10, bottom: 10),
      title: Text('Crea una sección', textAlign: TextAlign.center),
      children: [

        TextField(
          controller: tituloSeccion,
          focusNode: tituloSeccionFocus,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            icon: Icon(Icons.text_fields, color: Colors.black54),
            labelText: 'Título de la sección',
            helperText: 'Procura que el título sea claro y específico.',
            helperMaxLines: 2
          ),
          onEditingComplete: () => tituloSeccionFocus.unfocus(),
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
          onPressed: () {},
        )

      ]
    );
  }
}

class UiSeccion extends StatelessWidget {

  final String titulo;
  final List<DatosArchivos> archivos;
  final Color color;

  UiSeccion({
    this.titulo,
    this.archivos,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(titulo, overflow: TextOverflow.ellipsis),
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
          likes        : archivos[i].like,
          extension    : archivos[i].extension
        )
      )   
    );
  }
}