import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:smart_grocery/food/recipe.dart';
import 'package:smart_grocery/food/ingredient.dart';
import 'package:smart_grocery/store/store.dart';

// import 'package:Smart_Grocery/lib/food/recipe.dart';




/*Setup DB by calling in the instantiation class
* DatabaseHelper dbHelper = DatabaseHelper.instance;
* await dbHelper.loadUsersFromCSV();
* await dbHelper.loadIngredientsFromJSON();
* await dbHelper.loadRecipesFromJSON();*/

class DatabaseHelper {

  // setup of the database
  static final _dbName = 'smartGrocery.db';
  static final _dbVersion = 1;


  // add table vars here
  static final usersTable = 'users';
  // the columns in the users.csv file
  static final columnUserId = 'ID';
  static final columnName = 'Name';
  static final columnEmail = 'Email';
  static final columnPhoneNumber = 'PhoneNumber';
  static final columnUserName = 'Username';
  static final columnLocation = 'Location';
  static final columnPaymentInfo = 'PaymentINFO';
  static final columnFoodPreferences = 'FoodPreference';


  // recipes
  static final recipeTable = 'recipes';
  static final columnRecipeTitle = 'Recipe_title';
  static final columnInstructions = 'instructions';
  static final columnIngredients = 'ingredients';
  static final columnRecipeId = 'recipe_id';

  // Ingredients
  static final ingredientsTable = 'ingredients';
  static final columnIngredientName = 'ingredient';
  static final columnIngredientId = 'ingredient_id';
  static final columnIngredientCost = 'cost';
  static final columnIngredientQty = 'inventory_qty';

  // Stores
  static final groceryStoresTable = 'grocery_stores';
  static final columnStoreName = 'Store name';
  static final columnStoreAddress = 'Address';
  static final columnStoreZip = 'Zip';
  static final columnStoreLocation = 'Location';
  static final columnStoreId = 'store_id';



  // Making it a Singleton
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter
  Future<Database> get database async {
    if (_database != null) return _database!;
    //
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
        path,
        version: _dbVersion,
        onCreate: _onCreate);
  }

  // Future _onCreate(Database db, int version) async {
  //
  //   // add tables here
  //
  //   // users table
  //   // await db.execute('''
  //   //       CREATE TABLE $usersTable (
  //   //         $columnUserId INTEGER PRIMARY KEY,
  //   //         $columnName TEXT NOT NULL,
  //   //         $columnEmail TEXT NOT NULL,
  //   //         $columnPhoneNumber TEXT,
  //   //         $columnUserName TEXT NOT NULL,
  //   //         $columnLocation TEXT,
  //   //         $columnPaymentInfo TEXT,
  //   //         $columnFoodPreferences TEXT
  //   //       )
  //   //       ''');
  //
  //   // recipe table
  //   // await db.execute('''
  //   //       CREATE TABLE $recipeTable (
  //   //       $columnRecipeTitle TEXT,
  //   //       $columnInstructions TEXT,
  //   //       $columnIngredients TEXT,
  //   //       $columnRecipeId INTEGER PRIMARY KEY
  //   //       )
  //   //       ''');
  //
  //   await db.execute('''
  //         CREATE TABLE $recipeTable (
  //         $columnRecipeTitle TEXT,
  //         $columnInstructions TEXT,
  //         $columnIngredients TEXT,
  //         $columnRecipeId INTEGER PRIMARY KEY
  //         )
  //         ''');
  //   // ingredients table
  //   // await db.execute('''
  //   //       CREATE TABLE $_itemTable (
  //   //       $columnRecipeId INTEGER PRIMARY KEY,
  //   //       $columnRecipeTitle TEXT,
  //   //       $columnIngredients TEXT,
  //   //       FOREIGN KEY($columnRecipeId) REFERENCES $_recipeTable($columnRecipeId)
  //   //       )
  //   //       ''');
  //   // await db.execute('''
  //   //       CREATE TABLE $itemTable (
  //   //       $columnIngredientId INTEGER PRIMARY KEY AUTOINCREMENT,
  //   //       $columnIngredientName TEXT NOT NULL
  //   //   )
  //   //   ''');
  //
  // }

  // CRUD operations

  // // USER operations
  //
  // // Create: insert a user into the DB
  // Future<int> insertUser(Map<String, dynamic> user) async {
  //   Database db = await instance.database;
  //   return await db.insert(usersTable, user);
  // }
  //
  // // Read: find a user in the DB
  // Future<List<Map<String, dynamic>>> queryAllUsers() async {
  //   Database db = await instance.database;
  //   return await db.query(usersTable);
  // }
  //
  // // Update: change user details
  // Future<int> updateUser(Map<String, dynamic> user) async {
  //   Database db = await instance.database;
  //   int id = user[columnUserId];
  //   return await db.update(usersTable, user, where: '$columnUserId = ?', whereArgs: [id]);
  // }
  //
  // // Delete: remove a user from the DB
  // Future<int> deleteUser(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(usersTable, where: '$columnUserId = ?', whereArgs: [id]);
  // }

  // RECIPE operations

  // Create: insert a recipe into the DB

  Future _onCreate(Database db, int version) async {
    await db.execute('''
           CREATE TABLE $recipeTable (
             $columnRecipeTitle TEXT NOT NULL,
             $columnInstructions TEXT,
             $columnIngredients TEXT NOT NULL,
             $columnRecipeId INTEGER PRIMARY KEY
           )
           ''');
    await db.execute('''CREATE TABLE $ingredientsTable(
            $columnIngredientName TEXT NOT NULL,
            $columnIngredientId INTEGER PRIMARY KEY,
            $columnIngredientCost DOUBLE,
            $columnIngredientQty DOUBLE
            )
            ''');

    await db.execute('''CREATE TABLE $groceryStoresTable(
            $columnStoreName TEXT,
            $columnStoreAddress TEXT,
            $columnStoreZip INTEGER,
            $columnStoreLocation TEXT,
            $columnStoreId INTEGER PRIMARY KEY
            )
            ''');

  }


  // RECIPE OPERATIONS

  // the updated version of inserting a recipe
  Future<int> insertRecipe(Recipe recipe) async{
    Database db = await instance.database;
    return await db.insert(recipeTable, recipe.toMap());
  }

  // Read: fetch all recipes from the DB
  // DELETE IF NOT NEEDED
  Future<List<Map<String, dynamic>>> queryAllRecipes() async {
    Database db = await instance.database;
    return await db.query(recipeTable);
  }

  // updated version of get all recipes
  Future<List<Recipe>> getAllRecipes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(recipeTable);
    return List.generate(maps.length, (i) {
      return Recipe.fromMap(maps[i]);
    });
  }

  // updated version of updating a recipe
  Future<int> updateRecipe(Recipe recipe) async {
    Database db = await instance.database;
    return await db.update(recipeTable, recipe.toMap(),
        where: '$columnRecipeId = ?', whereArgs: [recipe.recipe_id]);
  }

  Future<int> deleteRecipe(int id) async {
    Database db = await instance.database;
    return await db.delete(recipeTable, where: '$columnRecipeId = ?', whereArgs: [id]);
  }


  // INGREDIENT OPERATIONS

  Future<int> insertIngredient(Ingredient ingredient) async{
    Database db = await instance.database;
    return await db.insert(ingredientsTable, ingredient.toMap());
  }

  Future<List<Ingredient>> getAllIngredients() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(ingredientsTable);
    return List.generate(maps.length, (i) {
      return Ingredient.fromMap(maps[i]);
    });
  }

  // updated version of updating a recipe
  Future<int> updateIngredient(Ingredient ingredient) async {
    Database db = await instance.database;
    return await db.update(ingredientsTable, ingredient.toMap(),
        where: '$columnIngredientId = ?', whereArgs: [ingredient.ingredient_id]);
  }

  Future<int> deleteIngredient(int id) async {
    Database db = await instance.database;
    return await db.delete(ingredientsTable, where: '$columnIngredientId = ?', whereArgs: [id]);
  }


  // Store operations

  Future<int> insertStore(Store store) async{
    Database db = await instance.database;
    return await db.insert(recipeTable, store.toMap());
  }

  Future<List<Store>> getAllStores() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(groceryStoresTable);
    return List.generate(maps.length, (i) {
      return Store.fromMap(maps[i]);
    });
  }

  // updated version of updating a recipe
  Future<int> updateStore(Store store) async {
    Database db = await instance.database;
    return await db.update(groceryStoresTable, store.toMap(),
        where: '$columnStoreId = ?', whereArgs: [store.id]);
  }

  Future<int> deleteStore(int id) async {
    Database db = await instance.database;
    return await db.delete(groceryStoresTable, where: '$columnStoreId = ?', whereArgs: [id]);
  }


  // Load the recipes
  Future<void> loadRecipesFromJSON() async {
    // Load JSON from assets
    String jsonData = await rootBundle.loadString('assets/data/Merged_Recipes.json');

    List<dynamic> recipeList = json.decode(jsonData);

    for (var recipe in recipeList) {
      Map<String, dynamic> recipeMap = {
        columnRecipeId: recipe['recipe_id'],
        columnRecipeTitle: recipe['Recipe_title'],
        columnInstructions: recipe['instructions'],
        columnIngredients: json.encode(recipe['ingredients']) // Convert list to string
      };
      await insertRecipe(recipeMap);
    }
  }
  List<dynamic> jsonData = [];

  Future<List<dynamic>> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data2.json');
    List<dynamic> data = jsonDecode(jsonString);
    return data;
  }




}
