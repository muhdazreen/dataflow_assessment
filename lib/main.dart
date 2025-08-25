import 'package:dataflow_assessment/navigationator.dart';
import 'package:flutter/material.dart';
// import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dataflows Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        body: SafeArea(
          child: SafeArea(child: Navigationator())
        ),
      )
    );
  }
}