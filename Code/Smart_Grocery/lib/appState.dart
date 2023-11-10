import 'package:flutter/foundation.dart';
import 'package:smart_grocery/databaseHelper.dart';
import 'package:smart_grocery/food/ingredient.dart';
import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/store/store.dart';

class AppData extends ChangeNotifier  {

  List <Recipe> listOfRecipies = [] ; 
  List <Ingredient>  listOfIngredients = []; 
  List<Store> listOfStores = [] ; 
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  AppData() {
    initDatabase(); 
  }

  Future<void> initDatabase() async {
    // Load the recipes from the database in to local varialbe 
    listOfRecipies = await _dbHelper.getAllRecipes();
    notifyListeners();
    print('Recipes for recipes page: ${listOfRecipies.length}');

    // Load the ingredients from the database in to local varialbe 
    listOfIngredients = await _dbHelper.getAllIngredients();
    notifyListeners();
    print('Ingredients for Pantry page: ${listOfIngredients.length}');

    // Load the Store from the database in to local varialbe 
    listOfStores = await _dbHelper.getAllStores(); 
    notifyListeners(); 
    print('Stores for store page: ${listOfStores.length}');
  
  }


}