import 'dart:io';

import 'package:flutter/material.dart';
import 'package:appuntes/Upload/selecionar_archivos.dart';

class Perfil extends StatefulWidget{
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  bool permitirInvitacion = true;
  File imagen;
  FocusNode nicknameFocus;
  FocusNode correoFocus;
  FocusNode passwordFocus;
  TextEditingController nickname;
  TextEditingController correo;
  TextEditingController password;

  @override
  void initState() { 
    super.initState();
    nickname = TextEditingController();
    correo   = TextEditingController();
    password = TextEditingController();

    nicknameFocus = FocusNode();
    correoFocus   = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    nickname.dispose();
    correo.dispose();
    password.dispose();

    nicknameFocus.dispose();
    correoFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
        centerTitle: true
      ),

      body: ListView(
        padding: EdgeInsets.only(top: 15),
        children: [
          Center(
            child: Container(
              width: 150, height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: imagen == null? BoxFit.scaleDown : BoxFit.fill,
                  image: imagen == null
                  ? AssetImage('assets/images/not_photo.jpg') 
                  : FileImage(imagen),
                )
              )
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('Seleccionar '),
                onPressed: () => filePicker.seleccionImagen.then(
                  (value) => setState(() => imagen = File(value.files.single.path))
                )
              ),

              imagen != null? TextButton(
                child: Text('Descartar'),
                onPressed: () => setState(() => imagen = null)
              ) : SizedBox()

            ]
          ),

          Divider(height: 10, thickness: 2),

          opcionPerfil(
            opcion     : 'Nickname',
            controller : nickname,
            focus      : nicknameFocus,
            icon       : Icons.person
          ),

          opcionPerfil(
            opcion     : 'Correo',
            controller : correo,
            focus      : correoFocus,
            icon       : Icons.email
          ),

          opcionPerfil(
            opcion     : 'Contraseña',
            controller : password,
            focus      : passwordFocus,
            icon       : Icons.shield
          ),

          ListTile(
            leading: Icon(Icons.send),
            title: Text('Permitir invitaciones'),
            subtitle: Text(permitirInvitacion == true? 'Permitido' : 'No permitido'),
            trailing: Switch.adaptive(
              value: permitirInvitacion,
              onChanged: (value) => setState(() => permitirInvitacion = value)
            )
          ),

        ]
      )
    );
  }

  Widget opcionPerfil({
    String opcion,
    TextEditingController controller, 
    FocusNode focus, 
    IconData icon,
    int maxLength,
    }){
    return ListTile(
      leading: Icon(icon),
      title: Text(opcion),
      subtitle: Text(controller.text?? ''),

      onTap: () => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          title: Text(opcion, textAlign: TextAlign.center),

          children: [
            TextField(
              controller: controller,
              focusNode: focus,
              minLines: 1, maxLines: 3,
              maxLength: maxLength,
              decoration: InputDecoration(
                icon: Icon(icon),
                hintText: 'Ingresa tu $opcion...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
              onEditingComplete: () => focus.unfocus()
            ),

            TextButton(
              child: Text('Guardar'),
              onPressed: () {}
            )
          ]
        )
      )
    );
    
  }
}