import 'package:flutter/material.dart';
import 'package:smart_grocery/store/store.dart';

class StoreDetailsPage extends StatelessWidget {
  final Store store;
  final Function() onPressed;
  const StoreDetailsPage(
      {super.key, required this.onPressed, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.name),
      ),
      body: Center(
        child: Text("store api with the list of uncheck items from recipe"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: onPressed,child: Icon(Icons.directions),),
    );
  }
}
