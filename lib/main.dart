import 'package:expenses_app/expenses.dart';
import 'package:expenses_app/theme.dart'; // all styles in one place
import 'package:flutter/material.dart';

void main() {
  // WidgetFlutterBinding.ensureInitialized(); // ensures that the Flutter engine is fully initialized before running the app
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((_) {
  //   runApp(const MyApp());
  // }); // locks the app orientation to portrait mode

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // system, light, dark
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Expenses(),
    );
  }
}
