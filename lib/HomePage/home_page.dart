import 'package:flutter/material.dart';

import 'package:appuntes/Upload/upload_page.dart';
import 'package:appuntes/ListaDeArchivos/lista_archivos.dart';
import 'package:appuntes/Upload/selecionar_archivos.dart';

import 'Comunidades/lista_comunidades.dart';
import 'search.dart';
import 'recientes.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  int _itemActual = 0;
  MaterialColor itemColor;
  FocusNode _mainPag;

  @override
  void initState() { 
    super.initState();
    _mainPag = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _mainPag.dispose();
  }

  final botones = [
    Archivos(),
    Recientes(),
    Comunidades(),
  ];

  final TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );

  final Icon _iconFloatingIconButton = Icon(
    Icons.add,
    color: Colors.white
  );

  @override
  Widget build(BuildContext context) {

    final DialogPlusButton dialogPlusButton = DialogPlusButton();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mis apuntes',
          style:  titleStyle   
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.white), 
            onPressed: () {
              showSearch(context: context, delegate: BuscadorDelegate());
            }
          )            
        ]
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.verified_user),
              ),
              accountName: Text('nick'),
              accountEmail: Text('correo@correo.com'),
            ),

            ListTile(
              leading: Icon(Icons.face, color: Colors.blue),
              title  :  Text('Perfil'),
              onTap  : () => Navigator.pushNamed(context, 'perfil')
            ),

            ListTile(
              leading: Icon(Icons.library_books, color: Colors.blue),
              title  :  Text('Mis apuntes'),
              onTap  : (){
              }
            ),

            ListTile(
              leading: Icon(Icons.chat, color: Colors.blue),
              title  :  Text('Mis comunidades'),
              onTap  : (){
              }
            ),

            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title  : Text('Ajustes'),
              onTap  : () => Navigator.pushNamed(context, 'ajustes')                
            )
          ]
        )

      ),
 
    
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(_mainPag),
        child: botones[_itemActual], 
      ),
          
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _itemActual,
          unselectedItemColor: Colors.grey,
          items:[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books,
                color: _itemActual == 0? Colors.blue: null
              ), 
              label: 'Apuntes'
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _itemActual == 2? Colors.blue: null
              ), 
              label: 'Comunidades'
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.check_box,
                color: _itemActual == 1? Colors.blue: null
              ),
              label: 'Recientes'
            )

          ],
      
        onTap: (index) => setState(() => _itemActual = index),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: _iconFloatingIconButton,
        onPressed: (){ 
          showModalBottomSheet<void>(
            context: context,
            builder: (context) => dialogPlusButton.menu(context)
          );
        },
      ),
    );  
  }
}

class DialogPlusButton{

  Widget menu(BuildContext context){
    return Container(
      height: 60,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.upload_file,
              color: Colors.blue,
              size: 25
            ),
            title: Text(
              'Subir archivo',
              style: TextStyle(
                fontSize: 16
              )
            ),
            onTap: () => filePicker.multiSeleccion.then((archivo){
              if(archivo.files.isNotEmpty){             
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadPage(result: archivo))
                );
              }
            })
          )
        ]
      ),
    );
  }
}