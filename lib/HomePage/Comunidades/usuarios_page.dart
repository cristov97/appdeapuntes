import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import 'package:flutter/material.dart';

class ListaUsuarios extends StatefulWidget {
  final Comunidad comunidad;

  ListaUsuarios({
    this.comunidad
  });

  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
        backgroundColor: widget.comunidad.color,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){}
          )
        ],
      ),

      body: ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemCount: widget.comunidad.totalUsuarios,
        separatorBuilder: (context, i) {
          if(i == widget.comunidad.administradores.length - 1) return textDivider('Otros miembros:');
          if(i == 0) return SizedBox();
          return Divider();
        },
        itemBuilder: (context, i) {
          if(i == 0) return textDivider('Administradores:');
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(widget.comunidad.usuarios[i].nick.substring(0,1), style: TextStyle(color: Colors.white, fontSize: 12))
            ),
            title: Text(widget.comunidad.usuarios[i].nick),
            subtitle: Text(widget.comunidad.usuarios[i].correo),
            trailing: PopupMenuButton(
              icon: Icon(Icons.more_vert),
              elevation: 15,
              offset: Offset(10,10),
              itemBuilder: (context) => listaOpcionesUsuario(i),
              onSelected: (String item){
                if(item.contains('Quitar admin')){
                  setState(() => widget.comunidad.quitarAdmin(widget.comunidad.usuarios[i]));
                }
                if(item.contains('Dar admin')){
                  setState(() => widget.comunidad.darAdmin(widget.comunidad.usuarios[i]));
                }
                if(item.contains('Eliminar')){
                  setState(() => widget.comunidad.eliminarUsuario(widget.comunidad.usuarios[i]));
                }
              }
            )
          );
        }
      )
    );
  }

  Widget textDivider(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title, 
        style: TextStyle(
          color: widget.comunidad.color,
          fontSize: 17,
        )
      ),
    );
  }

  List<PopupMenuEntry<String>> listaOpcionesUsuario(int index){
    
    List<String> menuAdmin = [
      'Quitar admin',
      'Eliminar'
    ];

    List<String> menuMiembro = [
      'Dar admin',
      'Eliminar'
    ];

    if(widget.comunidad.usuarios[index].esAdmin == true) return menuAdmin.map(
      (String value) => PopupMenuItem<String>(
        child: Text(value),
        value: value
      )
    ).toList();

    else return menuMiembro.map<PopupMenuEntry<String>>(
      (String value) => PopupMenuItem<String>(
        child: Text(value),
        value: value
      )
    ).toList();
  }
}

