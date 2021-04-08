import 'Modelo_archivos.dart';
import 'Modelo_comunidades.dart';
import 'Modelo_notificacion.dart';

class Usuario{
  String nick;
  String correo;
  String imagen;
  String password;
  bool esAdmin = false;
  List<Comunidad> comunidadesMiembro;
  List<Comunidad> comunidadesAdmin;
  List<ModeloArchivo> archivos;
  List<ModeloArchivo> archivosRecomendados;
  List<Notificacion> _notificaciones = [];

  Usuario({
    this.nick,
    this.correo,
    this.imagen,
    this.password,
    this.esAdmin,
    this.comunidadesMiembro,
    this.comunidadesAdmin,
    this.archivos,
    this.archivosRecomendados
  });

  List<Comunidad> get comunidades => comunidadesMiembro + comunidadesAdmin;
  
  void eliminarComunidad(Comunidad comunidad){
    comunidadesAdmin.remove(comunidad);
    comunidadesMiembro.remove(comunidad);
  }

  List<Notificacion> get notificaciones => this._notificaciones;

  set nuevaNotificacion(Notificacion notificacion) { 
    if(_notificaciones.length == 20)  _notificaciones.removeLast();
    
    if(_notificaciones.isEmpty) _notificaciones.add(notificacion);
    else _notificaciones.insert(0, notificacion);
  }

}