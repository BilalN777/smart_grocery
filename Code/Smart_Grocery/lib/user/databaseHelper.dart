import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  // setup of the database
  static final _dbName = 'userDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'users';

  // the columns in the users.csv file
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnEmail = 'email';
  static final columnPhoneNumber = 'phoneNumber';

  // not currently in csv possibly an issue
  static final columnLocation = 'location';
  static final columnPaymentInfo = 'paymentInfo';
  static final columnFoodPreferences = 'foodPreferences';

  // Making it a Singleton class.
  // Only one instance of the database can exist
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhoneNumber TEXT
            $columnLocation TEXT,
            $columnPaymentInfo INTEGER,
            $columnFoodPreferences TEXT
          )
          ''');

  }

  // CRUD operations

  // Create: insert a user into the DB
  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert(_tableName, user);
  }

  // Read: find a user in the DB
  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  // Update: change user details
  Future<int> updateUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    int id = user[columnId];
    return await db.update(_tableName, user, where: '$columnId = ?', whereArgs: [id]);
  }

  // Delete: remove a user from the DB
  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }





}
