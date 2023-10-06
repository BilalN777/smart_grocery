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
  static final columnId = 'ID';
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
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhoneNumber TEXT
            $columnUserName TEXT NOT NULL
            $columnLocation TEXT,
            $columnPaymentInfo TEXT,
            $columnFoodPreferences TEXT
          )
          ''');

    // recipe table
    await db.execute('''
          CREATE TABLE $_recipeTable (
          $columnRecipeTitle TEXT PRIMARY KEY,
          $columnInstructions TEXT, 
          $columnIngredients TEXT
          )
          ''');

    // ingredients table
    await db.execute('''
          CREATE TABLE $_recipeTable (
          $columnRecipeTitle TEXT PRIMARY KEY,
          $columnIngredients TEXT,
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
    int id = user[columnId];
    return await db.update(_usersTable, user, where: '$columnId = ?', whereArgs: [id]);
  }

  // Delete: remove a user from the DB
  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete(_usersTable, where: '$columnId = ?', whereArgs: [id]);
  }





}
