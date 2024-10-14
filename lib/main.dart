import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    LoadHome();
  }

  bool showingsplash = true;

  // ignore: non_constant_identifier_names
  LoadHome(){
    Future.delayed(const Duration(seconds: 3) ,() {
      setState(() {
        showingsplash = false;
      });
    } );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: showingsplash ? const SplashScreen() : const HomeScreen(),
      
    );
  }
}