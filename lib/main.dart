import 'package:flutter/material.dart';

import 'package:stor_app/screens/home_screen.dart';
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
         HomePage.id:(context)=>HomePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}