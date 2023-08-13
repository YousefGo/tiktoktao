import 'package:flutter/material.dart';
import 'HomePage.dart';
void main () => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tiktoktak Game",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.orange,

      ),
      home:HomePage(),
    );
  }
}
