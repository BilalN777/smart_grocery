import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/models/recipe_tile.dart';
import 'package:smart_grocery/pages/recipe_details_page.dart';

class RecipePage extends StatefulWidget {
  final void Function() onPressed;
  const RecipePage({super.key, required this.onPressed});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String searchRecipe = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recieps"), actions: [
        Consumer<AppData>(builder: (context, database, child) {
          return IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate(database.listOfRecipies));
              },
              icon: Icon(Icons.search));
        })
      ]),
      body: getRecipelist(),
    );
  }

  Widget getRecipelist() {
    return Consumer<AppData>(builder: (context, database, child) {
      if (Provider.of<AppData>(context, listen: false).listOfRecipies.isEmpty)
        return Center(
          child: CircularProgressIndicator(), // The loading indicator
        );
      return ListView.builder(
        itemCount: database.listOfRecipies.length,
        itemBuilder: (context, index) {
          return RecipeTile(
            recipeName: database.listOfRecipies[index].Recipe_title,
            recipeImage: database.listOfRecipies[index].image_name,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RecipeDetailPage(
                  title: database.listOfRecipies[index].Recipe_title,
                  instruction: database.listOfRecipies[index].instructions,
                  ingredient: database.listOfRecipies[index].ingredients,
                  recipeImage: database.listOfRecipies[index].image_name,
                  onPressed: widget.onPressed,
                );
              }));
            },
            onPressed: () {
              database.AddFavorites(true, index);
            },
          );
        },
      );
    });
  }
}

class MySearchDelegate extends SearchDelegate {
  List<Recipe> recipes;
  List<Map<String, dynamic>> recipesResults = [];
  MySearchDelegate(this.recipes);
  static List<String> _previousSearchKeywords = [];

  List<Map<String, dynamic>> listOfMaps = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty)
              close(context, null);
            else
              query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Return a list view that contains all the recipes matching the result
    // TODO: use the same class used to build the recommendation page which is a list
    // TODO: of cards i.e. listview
    if (!_previousSearchKeywords.contains(query))
      _previousSearchKeywords.add(query);
    return ListView.builder(
      itemCount: recipesResults.length,
      itemBuilder: (context, index) {
        return RecipeTile(
          recipeName: recipesResults[index]["Recipe_title"],
          recipeImage: recipesResults[index]["image_name"],
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RecipeDetailPage(
                title: recipesResults[index]["Recipe_title"],
                instruction: recipesResults[index]["instructions"],
                ingredient: recipesResults[index]["ingredients"],
                recipeImage: recipesResults[index]["image_name"], onPressed: () {},
              );
            }));
          },
          onPressed: () {},
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = _previousSearchKeywords.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    if (suggestions.length == 0 && query.length == 0)
      suggestions = _previousSearchKeywords;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        ); // ListTile
      },
    ); // ListView.builder I
  }

  void doSearch() {
    for (var r in recipes) {
      listOfMaps.add(r.toMap());
    }

    recipesResults = listOfMaps.where((map) {
      String name = map['Recipe_title']?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
  }
}
