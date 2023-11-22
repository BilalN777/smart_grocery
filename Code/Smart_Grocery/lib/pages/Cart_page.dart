import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../store/store.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems;
  final Store store;
  const CartPage({Key? key, required this.cartItems, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(cartItems[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payment),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutPage(cartItems: cartItems, store: store)),
          );
        },
      ),
    );
  }
}
