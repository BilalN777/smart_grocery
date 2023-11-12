import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/databaseHelper.dart'; // Import your DatabaseHelper file
import 'package:smart_grocery/pages/login_page.dart';

void main() {
  DatabaseHelper.instance;
  runApp(
      ChangeNotifierProvider(create: (context) => AppData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Grocery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        textTheme: GoogleFonts.breeSerifTextTheme(Theme.of(context).textTheme),
      ),
      home: const LoginPage(),
    );
  }
}
