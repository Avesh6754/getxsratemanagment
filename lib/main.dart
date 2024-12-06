import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxsratemanagment/NotesApp/views/homeScreen.dart';
import 'package:getxsratemanagment/views/counterPage.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}
