import 'dart:math';

import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  final String recipeName;
  final random = Random();
  final List icons = [Icons.restaurant_rounded, Icons.restaurant_menu, Icons.table_restaurant_outlined] ;
  final void Function() onTap ; 
  final void Function() onPressed; 
  RecipeTile({super.key, required this.recipeName, required this.onTap, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(recipeName),
      leading: Icon(icons[random.nextInt(icons.length)]),
      onTap: onTap,
      trailing: IconButton(icon: Icon(Icons.favorite), onPressed: onPressed,),
    );
  }
}
