import 'package:flutter/material.dart';

import 'package:appuntes/HomePage/Comunidades/personalizar_comunidad.dart';
import 'package:appuntes/Widgets/ModalBottomSheetWidget.dart';
import 'Comunidades/comunidad_page.dart';
import 'Comunidades/lista_comunidades.dart';
import 'Comunidades/usuarios_page.dart';
import '../mis_datos.dart';

class MisComunidades extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MisComunidadesState();
}

class _MisComunidadesState extends State<MisComunidades>{ 

  @override
  void initState() { 
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis comunidades'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: (){}
          ),

          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){}
          )
        ]
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: misDatos.comunidades.length,
        itemBuilder: (context, i) => UiComunidad(
          comunidad : misDatos.comunidades[i],
          onTap     : () => showModalBottomSheet(
            context: context,
            builder: (context) => (
              misDatos.comunidadesAdmin.contains(misDatos.comunidades[i])
              ? menuAdmin(i)
              : menuMiembro(i)
            )
          )
        )
      )
    );
  }

  Widget menuMiembro(int index){
    return ModalBottomSheet(
      items: [
        ItemModalBottomSheet(
          icon   : Icons.group,
          option : 'Ingresar',
          onTap  : () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComunidadPage(comunidad: misDatos.comunidades[index]) 
            )
          )
        ),

        misDatos.comunidades.isEmpty || misDatos.comunidades == null? null : ItemModalBottomSheet(
          icon   : Icons.person_remove,
          option : 'Salir de la comunidad',
          onTap  : () => Navigator.pop(context, setState(() => misDatos.eliminarComunidad(misDatos.comunidades[index])))
        )
      ]
    );
  }

  Widget menuAdmin(int index){
    return ModalBottomSheet(
      items: [
        ItemModalBottomSheet(
          icon   : Icons.group,
          option : 'Ingresar',
          onTap  : () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComunidadPage(comunidad: misDatos.comunidades[index]) 
            )
          )
        ),

        ItemModalBottomSheet(
          icon   : Icons.palette,
          option : 'Personalizar',
          onTap  : () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalizarComunidad(
                tituloComunidad : misDatos.comunidades[index].nombre,
                descripcion     : misDatos.comunidades[index].descripcion,
                color           : misDatos.comunidades[index].color,
                imagen          : misDatos.comunidades[index].imagen,
                publico         : misDatos.comunidades[index].publico
              )
            )
          )
        ),

        ItemModalBottomSheet(
          icon   : Icons.face,
          option : 'Ver usuarios',
          onTap  : () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => ListaUsuarios(comunidad: misDatos.comunidades[index]))
          )
        ),

        misDatos.comunidades.isEmpty || misDatos.comunidades == null? null : ItemModalBottomSheet(
          icon   : Icons.person_remove,
          option : 'Salir de la comunidad',
          onTap  : () => Navigator.pop(context, setState(() => misDatos.eliminarComunidad(misDatos.comunidades[index])))
        )
      ]
    );
  }
}