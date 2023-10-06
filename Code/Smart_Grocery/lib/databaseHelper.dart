import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class DatabaseHelper {

  // setup of the database
  static final _dbName = 'smartGrocery.db';
  static final _dbVersion = 1;
  static final _usersTable = 'users';
  static final _recipeTable = 'recipes';
  static final _itemTable = 'ingredients';


  // add table vars here

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
  static final columnRecipeId = 'recipe_id';
  static final columnRecipeTitle = 'Recipe_title';
  static final columnInstructions = 'instructions';
  static final columnIngredients = 'ingredients';
  static final columnIngredientId = 'ingredient_id';
  static final columnIngredientName = 'ingredient';

  // Making it a Singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter
  // Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
        path,
        version: _dbVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {

    // add tables here

    // users table
    await db.execute('''
          CREATE TABLE $_usersTable (
            $columnUserId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhoneNumber TEXT,
            $columnUserName TEXT NOT NULL,
            $columnLocation TEXT,
            $columnPaymentInfo TEXT,
            $columnFoodPreferences TEXT
          )
          ''');

    // recipe table
    await db.execute('''
          CREATE TABLE $_recipeTable (
          $columnRecipeId INTEGER PRIMARY KEY,
          $columnRecipeTitle TEXT, 
          $columnInstructions TEXT, 
          $columnIngredients TEXT
          )
          ''');

    // ingredients table
    // await db.execute('''
    //       CREATE TABLE $_itemTable (
    //       $columnRecipeId INTEGER PRIMARY KEY,
    //       $columnRecipeTitle TEXT,
    //       $columnIngredients TEXT,
    //       FOREIGN KEY($columnRecipeId) REFERENCES $_recipeTable($columnRecipeId)
    //       )
    //       ''');
    await db.execute('''
          CREATE TABLE $_itemTable (
          $columnIngredientId INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnIngredientName TEXT NOT NULL
      )
      ''');

  }

  // CRUD operations

  // USER operations

  // Create: insert a user into the DB
  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert(_usersTable, user);
  }

  // Read: find a user in the DB
  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await instance.database;
    return await db.query(_usersTable);
  }

  // Update: change user details
  Future<int> updateUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    int id = user[columnUserId];
    return await db.update(_usersTable, user, where: '$columnUserId = ?', whereArgs: [id]);
  }

  // Delete: remove a user from the DB
  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete(_usersTable, where: '$columnUserId = ?', whereArgs: [id]);
  }

  // RECIPE operations

  // Create: insert a recipe into the DB
  Future<int> insertRecipe(Map<String, dynamic> recipe) async {
    Database db = await instance.database;
    return await db.insert(_recipeTable, recipe);
  }

  // Read: fetch all recipes from the DB
  Future<List<Map<String, dynamic>>> queryAllRecipes() async {
    Database db = await instance.database;
    return await db.query(_recipeTable);
  }

  // Update: modify an existing recipe in the DB
  Future<int> updateRecipe(Map<String, dynamic> recipe) async {
    Database db = await instance.database;
    int id = recipe[columnRecipeId];
    return await db.update(_recipeTable, recipe, where: '$columnRecipeId = ?', whereArgs: [id]);
  }

  // Delete: remove a recipe from the DB
  Future<int> deleteRecipe(int id) async {
    Database db = await instance.database;
    return await db.delete(_recipeTable, where: '$columnRecipeId = ?', whereArgs: [id]);
  }

  // INGREDIENT CRUD operations

  // Create: insert a new ingredient into the DB
    Future<int> insertIngredient(String ingredientName) async {
      Database db = await instance.database;
      return await db.insert(_itemTable, {columnIngredientName: ingredientName});
    }

  // Read: fetch all ingredients from the DB
    Future<List<Map<String, dynamic>>> queryAllIngredients() async {
      Database db = await instance.database;
      return await db.query(_itemTable);
    }

  // Read: fetch a specific ingredient by its ID
    Future<Map<String, dynamic>> queryIngredientById(int id) async {
      Database db = await instance.database;
      var result = await db.query(_itemTable, where: '$columnIngredientId = ?', whereArgs: [id]);
      return result.first;
    }

  // Update: modify an existing ingredient in the DB by its ID
    Future<int> updateIngredient(int id, String newIngredientName) async {
      Database db = await instance.database;
      return await db.update(
          _itemTable,
          {columnIngredientName: newIngredientName},
          where: '$columnIngredientId = ?',
          whereArgs: [id]
      );
    }

  // Delete: remove an ingredient from the DB by its ID
    Future<int> deleteIngredient(int id) async {
      Database db = await instance.database;
      return await db.delete(_itemTable, where: '$columnIngredientId = ?', whereArgs: [id]);
    }







  }
