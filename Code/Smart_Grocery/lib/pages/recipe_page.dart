import 'package:flutter/material.dart';
import 'package:smart_grocery/recipe_builder.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String searchRecipe = "" ;
  late GetRecipes GR;
  late Future<List<Map<String, dynamic>>>  listOfRecipies;
  @override
  void initState () {
    super.initState();
    GR   = GetRecipes(this.context) ;
    listOfRecipies = GR.listOfRecipies ;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
      alignment: Alignment.center,
      child: ListView(
        children: GR.getListTiles(this.context) ,
      ),
    );
  }
}
