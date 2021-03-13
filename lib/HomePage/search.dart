import 'package:flutter/material.dart';

import 'home_page.dart';

class BuscadorDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.blue),
        onPressed: (){
          
        }
      )
    ]; 
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.blue),
      onPressed: (){
        Navigator.pop(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    );
    
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return Text('Resultado');
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('Sugerencia');

  }

}