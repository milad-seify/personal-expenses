import 'package:flutter/material.dart';

import 'widgets/main_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  title: 'Personal Expenses',
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.yellow[900]),
          radius: const Radius.circular(30.0),
        ),
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
      home: const MyHomePage(),
    );
  }
}

// Platform.isIOS
//         ? CupertinoApp(
//             theme: CupertinoThemeData(
              
//               primaryColor: Colors.orange,
//               scaffoldBackgroundColor: Colors.orange[100],
//             ),
//             home: const MyHomePage(),
//           )