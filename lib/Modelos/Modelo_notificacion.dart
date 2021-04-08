import 'Modelo_usuarios.dart';
import 'Modelo_archivos.dart';
import 'Modelo_comunidades.dart';

enum Notificar{
  comentario,
  invitacion,
  recomendacion,
  solicitud
}

class Notificacion{
  Notificar tipo;
  Usuario emisor;
  String destinatario;
  String comentario;
  Comunidad comunidad;
  ModeloArchivo archivo;
  
  Notificacion({
    this.tipo,
    this.emisor,
    this.destinatario,
    this.comentario,
    this.comunidad,
    this.archivo,
  });

  Notificacion.comunidad({
    this.tipo,
    this.emisor,
    this.destinatario,
    this.comunidad,
    this.comentario
  });

  Notificacion.comentarioArchivo({
    this.tipo = Notificar.comentario,
    this.emisor,
    this.destinatario,
    this.archivo,
    this.comentario
  });

  Notificacion.recomendacionArchivo({
    this.tipo = Notificar.recomendacion,
    this.emisor,
    this.destinatario,
    this.archivo
  });

}