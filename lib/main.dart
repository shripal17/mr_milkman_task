import 'package:flutter/material.dart';
import 'package:milkman_task/screen/restaurants_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr. Milkman Task',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const RestaurantsScreen(),
    );
  }
}
