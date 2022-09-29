import 'package:flutter/material.dart';
import 'package:restaurant_app/home.dart';
import 'package:restaurant_app/utils/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    themeData: prefs.getBool('theme'),
  ));
}

class MyApp extends StatefulWidget {
  final bool? themeData;
  const MyApp({Key? key, this.themeData}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(themeData);
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final bool? data;

  ThemeData _themeData = ThemeConfig.lightTheme;

  _MyAppState(this.data);
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
