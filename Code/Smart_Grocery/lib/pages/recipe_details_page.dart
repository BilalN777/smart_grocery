import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class RecipeDetailPage extends StatelessWidget {
  final String title;
  final List instruction; 
  final List ingredient; 
  const RecipeDetailPage({super.key, required this.title, required this.instruction, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10 ,top: 8, bottom: 8),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.restaurant_menu_sharp,size: 100,)), 
            SizedBox(height: 50,),
            Text("Instructions:", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(" - ${instruction.join("\n - ")}",style: TextStyle(
                fontSize: 18,
              ),
            ), 
            SizedBox(height: 30,),
            Text("Instructions:", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(" - ${ingredient.join('\n - ')}", style: TextStyle(
                fontSize: 18
              ),
            )
          ],
        ),
      )
    );

  }
}