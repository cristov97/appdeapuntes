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
      appBar: AppBar(
        backgroundColor: color,
        title: Text(titulo, overflow: TextOverflow.ellipsis),
      ),

      body: ListView.builder(
        itemCount: secciones.length,
        itemBuilder: (context, i) => Column(
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
              ),
            ),

            Divider(color: Colors.black26)
          ]
        ),
      )   
    );
   /* CustomScrollView(
      slivers: [
        SliverAppBar(
          
        ),

        SliverPersistentHeader(
          delegate: ComunidadHeader(
            max: MediaQuery.of(context).size.height * 0.3,
            min: 0,
            color: color
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
                  ),
                ),

                Divider(color: Colors.black26)
              ]
            ),

            childCount: secciones.length,

          )
        )
      ]
    );*/
  }
}

/*class ComunidadHeader extends SliverPersistentHeaderDelegate{
  final double min;
  final double max;
  final Color color;
  final String titulo;

  ComunidadHeader({
    this.min,
    this.max,
    this.color,
    this.titulo
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: Text(
        titulo,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
      )
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}*/

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