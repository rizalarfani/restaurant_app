import 'package:flutter/material.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/utils/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeConfig.lightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Hub',
      theme: _themeData,
      darkTheme: ThemeConfig.darkTheme,
      home: const HomePage(),
    );
  }

  void changeTheme(ThemeData themeData) {
    setState(() {
      _themeData = themeData;
    });
  }
}
