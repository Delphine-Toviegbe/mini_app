import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mini_app/Controller/services.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter/services.dart';
// import '../model/user.dart';
// import '../vue/connexion.dart';
import '../vue/inscription.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //FF3C00FF
  final Color primaryColor = Color(0xFFE76D47);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini mobile app',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'INSCRPTION '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Inscription();
  }


  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
}
