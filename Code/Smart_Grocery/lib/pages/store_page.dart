import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/models/store_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class StorePage extends StatefulWidget {
  StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
      ),
      body: getListOfStore(),
    );
  }

  Widget getListOfStore() {
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
                storeName: database.listOfStores[index].name,
                address: database.listOfStores[index].address,
                onTap: () {
                  _launchMapsUrl(database.listOfStores[index].address);
                },
              );
            }));
      },
    );
  }
}

Future<void> _launchMapsUrl(String address) async {
  final Uri googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}');

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}

