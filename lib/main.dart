import 'package:dio_crud/pages/ImagePickPage.dart';
import 'package:dio_crud/pages/dashboard.dart';
import 'package:dio_crud/pages/home_page.dart';
import 'package:dio_crud/pages/login_screen.dart';
import 'package:dio_crud/pages/students_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ImagePickPage(),
    );
  }
}

