import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String storeName;
  final String address;
  final void Function() onTap;
  StoreTile({super.key,
    required this.storeName,
    required this.address,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.storefront_sharp),
      title: Text(storeName),
      subtitle: Text(address),
      onTap: onTap,
    );
  }
}