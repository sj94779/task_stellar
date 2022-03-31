import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/provider.dart';
import 'package:task/ui/loginscreen.dart';


void main() {
  runApp(ChangeNotifierProvider<TodosProvider>(
    create: (context) => TodosProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  ));
}


