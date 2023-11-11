import 'dart:math';

import 'package:flutter/material.dart';
String path = 'assets/data/Food_Images/';
String extension = '.jpeg';
class RecipeTile extends StatelessWidget {
  final String recipeName;
  final String recipeImage;
  final random = Random();
  final List icons = [Icons.restaurant_rounded, Icons.restaurant_menu, Icons.table_restaurant_outlined] ;
  final void Function() onTap ; 
  final void Function() onPressed; 
  RecipeTile({super.key, required this.recipeName, required this.recipeImage, required this.onTap, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(recipeName),
      leading: Image(image: AssetImage(path + recipeImage + extension)),
      onTap: onTap,
      trailing: IconButton(icon: Icon(Icons.favorite), onPressed: onPressed,),
    );
  }
}
