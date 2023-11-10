import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_grocery/appState.dart';
import 'package:smart_grocery/databaseHelper.dart'; // Import your DatabaseHelper file
import 'package:smart_grocery/pages/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';


void main() {
  DatabaseHelper.instance;
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData() , 
      child: MyApp()
    )  
  );
}

