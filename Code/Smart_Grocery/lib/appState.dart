import 'package:flutter/foundation.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/food/ingredient.dart';
import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/store/store.dart';

class AppData extends ChangeNotifier {
  List<Recipe> listOfRecipies = [];
  List<Ingredient> listOfIngredients = [];
  List<Store> listOfStores = [];
  List<Recipe> listOfFavouriteRecipe = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  AppData() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    // Load the recipes from the database in to local varialbe
    listOfRecipies = await _dbHelper.getAllRecipes();
    notifyListeners();

    for (int i = 0; i < listOfRecipies.length; i++) {
      if (listOfRecipies[i].image_name == null)
        print('The image at index $i is null.'); 
    }
    print('Recipes for recipes page: ${listOfRecipies[7]}');

    // Load the ingredients from the database in to local varialbe
    listOfIngredients = await _dbHelper.getAllIngredients();
    notifyListeners();
    print('Ingredients for Pantry page: ${listOfIngredients.length}');

    // Load the Store from the database in to local varialbe
    listOfStores = await _dbHelper.getAllStores();
    notifyListeners();
    print('Stores for store page: ${listOfStores.length}');
  }

  ClearAllIngredients() {
    listOfIngredients = [];
    notifyListeners();
  }

  RemoveIngredientAt(int index) {
    listOfIngredients.removeAt(index);
    notifyListeners();
  }

  AddIngredient(Ingredient item) {
    listOfIngredients.add(item);
    notifyListeners();
  }

  AddFavorites(bool value, int index) {
    if (value) {
      listOfFavouriteRecipe.add(listOfRecipies[index]);
    }
    notifyListeners();
  }

  RemoveFavourties(int index) {
    listOfFavouriteRecipe.remove(listOfFavouriteRecipe[index]);
    notifyListeners();
  }
}
