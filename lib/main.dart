import 'package:flutter/material.dart';
import 'screens/QuizPage/QuizPage.dart';
import 'screens/HomePage/HomePage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/startplaying': (BuildContext context) => GetJson()
        },
        home: HomePage());
  }
}
