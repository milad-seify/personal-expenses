import 'package:flutter/material.dart';
import 'widgets/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[100],
        //  colorSchemeSeed: Colors.orange,
        colorScheme: ColorScheme(
            primary: Colors.pink,
            brightness: Brightness.light,
            onPrimary: Colors.yellow,
            secondary: Colors.purple,
            onSecondary: Colors.tealAccent,
            error: Colors.red,
            onError: Colors.red.shade100,
            background: Colors.brown,
            onBackground: Colors.deepOrangeAccent,
            surface: Colors.white,
            onSurface: Colors.black45),
      ),
      home: MyHomePage(),
    );
  }
}
