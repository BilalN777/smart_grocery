import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:smart_grocery/food/recipe.dart';
// import 'package:Smart_Grocery/lib/food/recipe.dart';

// Add imports for each of the data classes



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
  static final recipeTable = 'recipes';
  static final itemTable = 'ingredients';

  // the columns in the users.csv file
  static final columnUserId = 'ID';
  static final columnName = 'Name';
  static final columnEmail = 'Email';
  static final columnPhoneNumber = 'PhoneNumber';
  static final columnUserName = 'Username';
  static final columnLocation = 'Location';
  static final columnPaymentInfo = 'PaymentINFO';
  static final columnFoodPreferences = 'FoodPreference';

  // the columns in the recipe json
  static final columnRecipeTitle = 'Recipe_title';
  static final columnInstructions = 'instructions';
  static final columnIngredients = 'ingredients';
  static final columnRecipeId = 'recipe_id';
  // static final columnIngredientId = 'ingredient_id';
  // static final columnIngredientName = 'ingredient';

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
  }


  Future<int> insertRecipe_2(Recipe recipe) async{
    Database db = await instance.database;
    return await db.insert(recipeTable, recipe.toMap());
  }




  Future<int> insertRecipe(Map<String, dynamic> recipe) async {
    Database db = await instance.database;
    return await db.insert(recipeTable, recipe);
  }

  // Read: fetch all recipes from the DB
  Future<List<Map<String, dynamic>>> queryAllRecipes() async {
    Database db = await instance.database;
    return await db.query(recipeTable);
  }

  // Update: modify an existing recipe in the DB
  Future<int> updateRecipe(Map<String, dynamic> recipe) async {
    Database db = await instance.database;
    int id = recipe[columnRecipeId];
    return await db.update(recipeTable, recipe, where: '$columnRecipeId = ?', whereArgs: [id]);
  }

  // Delete: remove a recipe from the DB
  Future<int> deleteRecipe(int id) async {
    Database db = await instance.database;
    return await db.delete(recipeTable, where: '$columnRecipeId = ?', whereArgs: [id]);
  }

  // INGREDIENT CRUD operations

  // Create: insert a new ingredient into the DB
    Future<int> insertIngredient(String ingredientName) async {
      Database db = await instance.database;
      return await db.insert(itemTable, {columnIngredientName: ingredientName});
    }

  // Read: fetch all ingredients from the DB
    Future<List<Map<String, dynamic>>> queryAllIngredients() async {
      Database db = await instance.database;
      return await db.query(itemTable);
    }

  // Read: fetch a specific ingredient by its ID
    Future<Map<String, dynamic>> queryIngredientById(int id) async {
      Database db = await instance.database;
      var result = await db.query(itemTable, where: '$columnIngredientId = ?', whereArgs: [id]);
      return result.first;
    }

  // Update: modify an existing ingredient in the DB by its ID
    Future<int> updateIngredient(int id, String newIngredientName) async {
      Database db = await instance.database;
      return await db.update(
          itemTable,
          {columnIngredientName: newIngredientName},
          where: '$columnIngredientId = ?',
          whereArgs: [id]
      );
    }

  // Delete: remove an ingredient from the DB by its ID
    Future<int> deleteIngredient(int id) async {
      Database db = await instance.database;
      return await db.delete(itemTable, where: '$columnIngredientId = ?', whereArgs: [id]);
    }

  // Future<void> loadUsersFromCSV() async {
  //   // Load CSV from assets
  //   String csvData = await rootBundle.loadString('assets/data/users.csv');
  //
  //   List<List<dynamic>> csvList = CsvToListConverter().convert(csvData);
  //
  //   // Skip the first row if it's a header
  //   for (int i = 1; i < csvList.length; i++) {
  //     Map<String, dynamic> user = {
  //       columnUserId: csvList[i][0],
  //       columnName: csvList[i][1],
  //       columnEmail: csvList[i][2],
  //       columnPhoneNumber: csvList[i][3],
  //       columnUserName: csvList[i][4],
  //       columnLocation: csvList[i][5],
  //       columnPaymentInfo: csvList[i][6],
  //       columnFoodPreferences: csvList[i][7]
  //     };
  //
  //     // await insertUser(user);
  //   }
  // }

  // Load the ingredients
  Future<void> loadIngredientsFromJSON() async {
    // Load JSON from assets
    String jsonData = await rootBundle.loadString('assets/data/Sorted_Ingredients.json');

    List<dynamic> ingredientList = json.decode(jsonData);

    for (var ingredient in ingredientList) {
      await insertIngredient(ingredient);
    }
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




}
