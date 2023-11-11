import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/food/ingredient.dart';
import 'package:smart_grocery/models/ingredients_tile.dart';
// import 'package:google_fonts/google_fonts.dart';

class PantryPage extends StatefulWidget {
  const PantryPage({super.key});

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  late TextEditingController tController;

  @override
  void initState() {
    super.initState();
    tController = TextEditingController();
  }

  @override
  void dispose() {
    tController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppData>(context, listen: false).listOfIngredients.isEmpty)
      return Scaffold(
        appBar: AppBar(
          title: Text("Pantry"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IngredientsAddPage()));
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  Provider.of<AppData>(context, listen: false)
                      .ClearAllIngredients();
                },
                icon: Icon(Icons.delete_forever))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tap the "Plus Icon" on the top right or Add button below to add ingredients to your pantry.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IngredientsAddPage()));
                  },
                  child: Text("Add"))
            ],
          ),
        ),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantry'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IngredientsAddPage()));
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Provider.of<AppData>(context, listen: false)
                    .ClearAllIngredients();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Consumer<AppData>(builder: (context, database, child) {
        return ListView.builder(
          itemCount: database.listOfIngredients.length,
          itemBuilder: (context, index) {
            return IngredientTile(
              name: database.listOfIngredients[index].name,
              quantity: database.listOfIngredients[index].qty_available,
              deleteIngrident: () => database.RemoveIngredientAt(index),
            );
          },
        );
      }),
    );
  }

  IngredientsAddPage() {
    String newIngredient = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Ingredient"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AppData>(builder: (contex, database, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0, right: 8.0)),
                  autofocus: true,
                  controller: tController,
                  onChanged: (text) {
                    newIngredient = text;
                  },
                  onSubmitted: (text) {
                    if (text.isNotEmpty) {
                      database.AddIngredient(Ingredient(
                          name: newIngredient,
                          ingredient_id: -1,
                          cost: 0.0,
                          qty_available: 1.0));
                      tController.clear();
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (newIngredient.isNotEmpty)
                        database.AddIngredient(Ingredient(
                            name: newIngredient,
                            ingredient_id: -1,
                            cost: 0.0,
                            qty_available: 1.0));
                      tController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Add"))
              ],
            );
          }),
        ),
      ),
    );
  }
}
