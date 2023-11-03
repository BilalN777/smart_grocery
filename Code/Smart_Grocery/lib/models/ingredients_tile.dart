import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final String name;
  final double cost;
  final void Function() deleteIngrident; 
  IngredientTile({super.key, required this.name, required this.cost, required this.deleteIngrident});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$name'),
      subtitle: Text('\$$cost'),
      trailing: IconButton(icon: Icon(Icons.delete), onPressed: deleteIngrident,),
    );
  }
}