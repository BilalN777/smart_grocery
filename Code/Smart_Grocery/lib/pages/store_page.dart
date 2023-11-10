import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/models/store_tile.dart';
import 'package:smart_grocery/store/store.dart';
import 'package:smart_grocery/databaseHelper.dart';
// import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatefulWidget {


  StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Store> storeList = [] ; 

  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<void> initDatabase() async {
      List <Store>  tempStores = await _dbHelper.getAllStores();
      setState(() {
        storeList = tempStores;
      });
      // print('Recipes form recipes page: ${recipes.length}');
   }

  @override
  void initState(){
    super.initState(); 
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
      ) ,
      body: getListOfStore() ,
    ); 
  }

  Widget getListOfStore() {
    // if (storeList.isEmpty)
    if (Provider.of<AppData>(context, listen: false).listOfStores.isEmpty)
      return Center(
        child: CircularProgressIndicator(), // The loading indicator
      );
    return Consumer<AppData>(
      builder: (context, database, child) {
        return ListView.builder(
          itemCount: database.listOfStores.length,
          itemBuilder: ((context, index) {
            return StoreTile(
              storeName: database.listOfStores[index].toMap()["store_name"],
              address: database.listOfStores[index].toMap()["Address"],
            );
        }));
      },
    ); 
    
    
    
    
  }
}