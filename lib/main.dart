import 'package:clickdrop/View/Homepage.dart';
import 'package:flutter/material.dart';

import 'View/AddInfoPage.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClickDrobe',
      theme: ThemeData(

        primaryColor:  const Color(0xFF6fffC8),
        appBarTheme:  const AppBarTheme(color: Color(0xFF78A6C8)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xFF78A6C8)),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     backgroundColor: const Color(0xFF78A6C8)
        //   )
        // )
      ),

      initialRoute: '/',
      routes: {
        // When navigating to the "homeScreen" route, build the HomeScreen widget.
        '/': (context) => HomePage(),
        // When navigating to the "secondScreen" route, build the SecondScreen widget.
        '/AddProductForm': (context) => AddInfoPage(),
      },

      //home:  const HomePage(),
    );
  }
}
