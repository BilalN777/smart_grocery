import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/food/ingredient.dart';
import 'package:smart_grocery/models/ingredients_tile.dart';
// import 'package:google_fonts/google_fonts.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {

  static List<String>userPantry = [] ;

  late TextEditingController tController ;

  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  static List <Ingredient>  ingredients = []; 

  Future<void> initDatabase() async {
    
    List <Ingredient>  tempIngredients = await _dbHelper.getAllIngredients();
    final random = Random();

    setState(() {
      ingredients = tempIngredients;
      for (int i = 0 ; i<ingredients.length; i++){
        ingredients[i].qty_available = random.nextInt(5).toDouble() ; 
      }
    });
    print('Recipes form recipes page: ${ingredients.length}');
  }

  @override
  void initState() {
    super.initState();
    tController = TextEditingController();
    initDatabase() ; 
  }

  @override
  void dispose() {
    tController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (ingredients.length == 0)
    if(Provider.of<AppData>(context, listen: false).listOfIngredients.isEmpty)
      return Scaffold(
        appBar: AppBar(
          title: Text("Pantry"),
          actions: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
            }, icon: Icon(Icons.add)),
            IconButton(onPressed: () {
              // setState(() {
              //   ingredients = [] ; 
              // });
              Provider.of<AppData>(context, listen: false).ClearAllIngredients(); 
            } , icon: Icon(Icons.delete_forever)
            )
          ],
        ),
        body : Container(
          // color: Colors.green[200],
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tap the "Plus Icon" on the top right or Add button below to add ingredients to your pantry.',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
              } , child: Text("Add"))
            ],
          ),
        ),
      );

    // // userPantry.sort();
    // ListView myList = ListView.builder(
    //   itemCount: ingredients.length,
    //   itemBuilder: (context, index) {
    //     // final ingredient = userPantry[index];
    //     // todo: code to check if the count is not 1 for data base
    //     print("$index") ; 
    //     return IngredientTile(
    //       name: ingredients[index].toMap()["name"], 
    //       quantity:1.0, 
    //       deleteIngrident: () => setState(() {
    //         // if (ingredients[index].qty_available == 1.0){
    //           // ingredients[index].qty_available = 0.0;
    //           ingredients.removeAt(index); 
    //         // }
    //         // else 
    //         //   ingredients[index].qty_available = ((ingredients[index].qty_available as int) -  1) as double; 
    //       })
    //     );
    //   },
    // );



    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry'),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => IngredientsAddPage()));
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: () {
              // setState(() {
              //   ingredients = [] ; 
              // });
              Provider.of<AppData>(context, listen: false).ClearAllIngredients(); 
            } , icon: Icon(Icons.delete_forever)
          )
        ],
      ),
      body:Consumer<AppData>(
        builder: (context, database, child) {
          return ListView.builder(
            itemCount: database.listOfIngredients.length,
            itemBuilder: (context, index) {
              // final ingredient = userPantry[index];
              // todo: code to check if the count is not 1 for data base
              // print("$index") ; 
              return IngredientTile(
                name: database.listOfIngredients[index].toMap()["name"], 
                quantity:1.0, 
                deleteIngrident: () => database.RemoveIngredientAt(index),
                // deleteIngrident: () => setState(() {
                //   // if (ingredients[index].qty_available == 1.0){
                //     // ingredients[index].qty_available = 0.0;
                //     ingredients.removeAt(index); 
                //   // }
                //   // else 
                //   //   ingredients[index].qty_available = ((ingredients[index].qty_available as int) -  1) as double; 
                // })
              );
            },
          );
        }
      ),
    );
  }

  IngredientsAddPage(){
    String newIngredient = "" ;
    int Count = 0 ; 
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Ingredient"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AppData>(
            builder: (contex, database, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0)
                    ),
                    autofocus: true,
                    controller: tController,
                    onChanged: (text) {
                      newIngredient = text;
                    },
                    onSubmitted: (text) {
                      if (text.isNotEmpty){
                        // setState(() {
                        //   userPantry.add(newIngredient);
                        //   ingredients.add(Ingredient(name: newIngredient, ingredient_id: -1, cost: 0.0, qty_available: 1.0));
                        // });
                        database.AddIngredient(
                          Ingredient(
                            name: newIngredient, 
                            ingredient_id: -1, 
                            cost: 0.0, 
                            qty_available: 1.0
                          )
                        ); 
                        tController.clear() ; 
                        Navigator.pop(context);
                      }
                    },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {
                    if (newIngredient.isNotEmpty)
                      // setState(() {
                      //   userPantry.add(newIngredient);
                      //   ingredients.add(Ingredient(name: newIngredient, ingredient_id: -1, cost: 0.0, qty_available: 1.0));
                      // });
                      database.AddIngredient(
                        Ingredient(
                          name: newIngredient, 
                          ingredient_id: -1, 
                          cost: 0.0, 
                          qty_available: 1.0
                        )
                      ); 
                    tController.clear(); 
                    Navigator.pop(context);
                  }, child: Text("Add"))
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
