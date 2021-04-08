import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget{
  final List<ItemModalBottomSheet> items;

  ModalBottomSheet({
    this.items
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (55.0 * items.length) + 20,
      child: Column(
        children: List.generate(
          items.length,
          (index) => ListTile(
            leading : Icon(items[index].icon, color: Colors.blue),
            title   : Text(items[index].option),
            onTap   : items[index].onTap
          )
        )
      )
    );
  }

}

class ItemModalBottomSheet{

  final IconData icon;
  final String option;
  final Function onTap;

  ItemModalBottomSheet({
    this.icon,
    this.option,
    this.onTap
  });
}