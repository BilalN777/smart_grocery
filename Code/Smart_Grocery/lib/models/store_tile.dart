import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String storeName ; 
  final String address; 
  const StoreTile({super.key, required this.storeName, required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.storefront_sharp),
      title: Text(storeName),
      subtitle: Text(address),
    );
  }
}