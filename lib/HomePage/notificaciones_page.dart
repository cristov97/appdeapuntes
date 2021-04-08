import 'package:flutter/material.dart';

import 'package:appuntes/ListaDeArchivos/avatar_archivos.dart';
import 'package:appuntes/Modelos/Modelo_archivos.dart';
import 'package:appuntes/Modelos/Modelo_comunidades.dart';
import 'package:appuntes/Modelos/Modelo_notificacion.dart';
import 'package:appuntes/Modelos/Modelo_usuarios.dart';
import 'package:appuntes/mis_datos.dart';

class NotificacionesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        backgroundColor: Theme.of(context).primaryColor
      ),

      body: misDatos.notificaciones.isEmpty
      ? Center(
        child: Text('No tienes notificaciones', style: TextStyle(fontSize: 20, color: Colors.black54))
      )

      : ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemCount: misDatos.notificaciones.length,
        itemBuilder: (context, i) => notificationListTile(misDatos.notificaciones[i]),
        separatorBuilder: (context, i) => Divider()
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => 
          setState(() {
            misDatos.nuevaNotificacion = Notificacion.comunidad(
            tipo: Notificar.invitacion,
            emisor: Usuario(nick: 'JSJSJSJJAKEIENDKK'),
            comunidad: Comunidad(
              nombre: 'mates',
              descripcion: '54545',
              color: Colors.red
            )
            );

            misDatos.nuevaNotificacion = Notificacion.recomendacionArchivo(
            emisor: Usuario(nick: 'youo'),
            archivo: ModeloArchivo.mostrar(
              nombre: 'guia 1 cienca llgkgj ohkhhkjh fdgfdg piggfhdgfd kjhkjhj ',
              asignatura: 'mates'
            )
            );

            misDatos.nuevaNotificacion = Notificacion.comunidad(
            tipo: Notificar.solicitud,
            emisor: Usuario(nick: 'popqoei2'),
            comunidad: Comunidad(
              nombre: 'ingles',
              descripcion: '54545',
              color: Colors.yellow
            ),
            comentario: 'JSJSjk jakjkj kdjkj laklkld laklk l'
            );

            misDatos.nuevaNotificacion = Notificacion.comentarioArchivo(
            emisor: Usuario(nick: 'Jejej'),
            archivo: ModeloArchivo.mostrar(
              nombre: 'Guia 5 ciencia de los materioales',
              asignatura: 'Ciencia de los materiales'
            ),
            comentario: 'La creatividad, en sentido limitado, se refiere a las aptitudes que son características de los individuos creadores, como la fluidez, la flexibilidad, laoriginalidad y el pensamiento divergente Thurstone (1952): Es un proceso para formar ideas o hipótesis, verificarlas y comunicar los resultados, suponiendo que el producto creado sea algo nuevo'
          );
          }
        )
  
      )
    );
  }

  Widget notificationListTile(Notificacion notificacion){

    CircleAvatar avatarUsuario = CircleAvatar(
      //backgroundImage: NetworkImage(notificacion.emisor.imagen)?? null,
      child: notificacion.emisor.imagen == null? Text(notificacion.emisor.nick.substring(0,1)) : null
    );

    Widget titleText({String emisor, String mensaje, Color remarcado}){
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: emisor,
              style: TextStyle(color: remarcado, fontSize: 16, fontWeight: FontWeight.bold)
            ),
            TextSpan(text: mensaje, style: TextStyle(color: Colors.black, fontSize: 16))
          ]
        )
      );
    }

    Widget subtitle({String title, String textButton, Function onPressed, Text modificableText}){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modificableText?? Text(title),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text(textButton, style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: onPressed
            )
          )
        ]
      );
    }

    switch (notificacion.tipo) {
      case Notificar.comentario:
        return ListTile(
          leading: avatarUsuario,
          title: Text('Alguien ha comentado uno de tus archivos'),
          subtitle: subtitle(
            modificableText: Text(
              notificacion.comentario,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify
            ),
            textButton: 'Ver más',
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                title: Text(notificacion.archivo.nombre),
                children: [
                  ListTile(
                    leading: avatarUsuario,
                    title: Text(notificacion.emisor.nick),
                    subtitle: Text(notificacion.comentario)
                  )
                ]
              )
            )
          )
        );
      break;

      case Notificar.recomendacion:
        return ListTile(
          leading: AvatarArchivo(notificacion.archivo.nombre, notificacion.archivo.extension),
          title: titleText(
            emisor: notificacion.emisor.nick,
            mensaje: ' te han recomendado un archivo',
            remarcado: Colors.green
          ),
          subtitle: subtitle(
            title: notificacion.archivo.nombre,
            textButton: 'Descargar',
            onPressed: (){}
          )
        );
      break;

      case Notificar.invitacion:
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: notificacion.comunidad.color,
            //backgroundImage: NetworkImage(notificacion.comunidad.imagen)?? null,
            child: ( 
              notificacion.comunidad.imagen == null
              ? Text(notificacion.comunidad.nombre.substring(0,1))
              : null
            )
          ),
          title: titleText(
            emisor: notificacion.emisor.nick,
            mensaje: ' te ha invitado a su comunidad',
            remarcado: notificacion.comunidad.color
          ),
          subtitle: subtitle(
            title: notificacion.comunidad.nombre,
            textButton: 'Ver',
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                title: Text(notificacion.comunidad.nombre),
                children: [
                  ListTile(
                    title: Text(notificacion.comunidad.descripcion),
                    
                  ),
                  TextButton(
                    child: Text('Unirme'),
                    onPressed: (){}
                  )
                ]
              )
            )
          )
        );
      break;

      case Notificar.solicitud:
        return ListTile(
          leading: avatarUsuario,
          title: titleText(
            emisor: notificacion.emisor.nick,
            mensaje: ' pidió unirse a tu comunidad',
            remarcado: notificacion.comunidad.color
          ),
          subtitle: subtitle(
            title: notificacion.comunidad.nombre,
            textButton: 'Ver',
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                title: Text(notificacion.comunidad.nombre),
                children: [
                  ListTile(
                    leading: avatarUsuario,
                    title: Text(notificacion.emisor.nick),
                    subtitle: Text(notificacion.comentario)
                  ),
                  TextButton(
                    child: Text('Aceptar solicitud'),
                    onPressed: (){}
                  )
                ]
              )
            )
          )
        );
      break;

      default: return SizedBox();
    }
  }
}