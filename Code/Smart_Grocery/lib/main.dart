import 'package:flutter/material.dart';
import 'package:smart_grocery/databaseHelper.dart'; // Import your DatabaseHelper file
import 'package:smart_grocery/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  DatabaseHelper.instance;
  runApp(const MyApp());
}

