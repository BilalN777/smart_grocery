import 'package:flutter/material.dart';

String path = 'assets/data/Food_Images/';
String extension = '.jpeg';

class RecipeDetailPage extends StatelessWidget {
  final String title;
  final List instruction;
  final List ingredient;
  final String recipeImage;
  const RecipeDetailPage(
      {super.key,
      required this.title,
      required this.instruction,
      required this.ingredient,
      required this.recipeImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.store_sharp))],
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          child: ListView(
            children: [
              Center(
                  child: Hero(
                      tag: recipeImage + " hero",
                      child: Image(
                          image: AssetImage(path + recipeImage + extension)))),
              SizedBox(
                height: 50,
              ),
              Text(
                "Instructions:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                " - ${instruction.join("\n - ")}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Instructions:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                " - ${ingredient.join('\n - ')}",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ));
  }
}
