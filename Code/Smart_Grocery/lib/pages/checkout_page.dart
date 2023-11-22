import 'package:flutter/material.dart';
import 'package:smart_grocery/pages/store_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../store/store.dart';

class CheckoutPage extends StatelessWidget {
  final List<String> cartItems;
  final Store store; // Add Store as a parameter to pass the original store

  const CheckoutPage({Key? key, required this.cartItems, required this.store}) : super(key: key);

  Future<void> _launchMapsUrl(String address) async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(cartItems[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Place Order'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Order Placed'),
                    content: Text('Your order has been placed successfully!'),
                    actions: [
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog

                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('Directions'),
                        onPressed: () {
                          // this is where you would add the code to open the maps app
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.of(context).pop(); // Close the dialog


                          _launchMapsUrl(store.address);

                          ;
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
