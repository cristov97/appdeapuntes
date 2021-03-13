import 'package:flutter/material.dart';

import 'Otros/validaciones.dart';

enum LoginMenu{
  menu,
  registro,
  sesion
}

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginMenu opcion = LoginMenu.menu;
  bool obscureText = false;
  bool registrado = false;
  FocusNode nickFocus;
  FocusNode correoFocus;
  FocusNode passwordFocus;
  TextEditingController nick;
  TextEditingController correo;
  TextEditingController password;

  @override
  void initState() {
    super.initState();

    nick     = TextEditingController();
    correo   = TextEditingController();
    password = TextEditingController();

    nickFocus     = FocusNode();
    correoFocus   = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() { 
    super.dispose();

    nick.dispose();
    correo.dispose();
    password.dispose();

    nickFocus.dispose();
    correoFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final pantalla = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: pantalla.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[700], Colors.blue[900]]
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
            )
          ),

          Center(
            child: Container(
              width: pantalla.width * 0.9,
              height: opcion == LoginMenu.menu 
              ? pantalla.height * 0.25
              : pantalla.height * 0.4,
              padding: EdgeInsets.fromLTRB(
                pantalla.width * 0.035,
                pantalla.height * 0.03,
                pantalla.width * 0.04,
                pantalla.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Colors.black38, offset: Offset(2,2)),
                  BoxShadow(color: Colors.black38, offset: Offset(-1,0))
                ]
              ),
              child: opcion == LoginMenu.menu? login : form
            )
          ),

          Positioned(
            top: pantalla.height * 0.05,
            right: pantalla.width * 0.025,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.black26)
              ),
              child: Row(
                children: [
                  Text(
                    'Omitir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    )
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30
                  )
                ]
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home')
            )
          )
        ]
      )
    );
  }

  Widget get login{

    final buttonPadding = EdgeInsets.symmetric(horizontal: 30, vertical: 10);
    final buttonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    final buttonStyle = TextStyle(fontSize: 20);

    return Column(
      children: [
        Text(
          '¡Bienvenido/a!',
          style: TextStyle(fontSize: 25)
        ),

        SizedBox(height: 15),

        RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: buttonPadding,
          shape: buttonShape,
          child: Text('Registrarme', style: buttonStyle),
          onPressed: () => setState(() => opcion = LoginMenu.registro)
        ),

        SizedBox(height: 10),

        RaisedButton(
          color: Colors.green,
          textColor: Colors.white,
          padding: buttonPadding,
          shape: buttonShape,
          child: Text('Iniciar sesión', style: buttonStyle),
          onPressed: () => setState(() => opcion = LoginMenu.sesion)
        )
      ]
    );
  }

  Widget get form{
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue),
                onPressed: () { 
                  nick.clear();
                  correo.clear();
                  password.clear();
                  setState(() => opcion = LoginMenu.menu);
                }
              ),

              Text(
                opcion == LoginMenu.registro? 'Registro' : 'Inicia sesión',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20)
              ),
            ],
          ),

          Spacer(),
          
          opcion != LoginMenu.registro? SizedBox() : TextFormField(
            controller: nick,
            focusNode: nickFocus,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              icon: Icon(Icons.face, color: Colors.blue),
              hintText: 'Crea un nick'
            ),
            onEditingComplete: () => FocusScope.of(context).requestFocus(correoFocus)
          ),

          TextFormField(
            controller: correo,
            focusNode: correoFocus,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) => Validar.correo(value),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.blue),
              hintText: 'Ingresa tu correo'
            ),
            onEditingComplete: () => FocusScope.of(context).requestFocus(passwordFocus)
          ),

          TextFormField(
            controller: password,
            focusNode: passwordFocus,
            obscureText: obscureText,
            decoration: InputDecoration(
              icon: Icon(Icons.privacy_tip, color: Colors.blue),
              hintText: opcion == LoginMenu.registro? 'Crea una contraseña': 'Contraseña',
            ),
            onEditingComplete: () => passwordFocus.unfocus()
          ),

          Spacer(),

          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(opcion == LoginMenu.registro? 'Registrar':'Iniciar'),
            onPressed: (){},
          ),

          opcion == LoginMenu.registro? SizedBox() : TextButton(
            child: Text(
              '¿Haz olvidado tu contraseña?',
              style: TextStyle(color: Colors.blue)
            ),
            onPressed: (){
              registrado = !registrado;
            }
          )
        ]
      )
    );
  }

}

  