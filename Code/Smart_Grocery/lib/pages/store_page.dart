import 'package:flutter/material.dart';
import 'package:smart_grocery/models/store_tile.dart';
import 'package:smart_grocery/store/store.dart';
import 'package:smart_grocery/databaseHelper.dart';

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
    return Container(
      child: getListOfStore() ,
    ); 
  }

  Widget getListOfStore() {
    if (storeList.isEmpty)
      return Center(
        child: CircularProgressIndicator(), // The loading indicator
      );
    return ListView.builder(
      itemCount: storeList.length,
      itemBuilder: ((context, index) {
        return StoreTile(
          storeName: storeList[index].toMap()["store_name"],
          address: storeList[index].toMap()["Address"],
        );
    }));
  }
}