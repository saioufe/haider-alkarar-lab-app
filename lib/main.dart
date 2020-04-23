import 'package:a_alkarar_lab/screens/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haider alkarar Lab',
      theme: ThemeData(
        fontFamily: 'khebrat',
        textTheme: TextTheme(
            subtitle: TextStyle(
                fontFamily: "akhand", fontSize: 20, color: Color(0xFF45B649))),
        canvasColor: Color(0xFFecedf1),
        primaryColor: Color(0xFF37d2b3),
        accentColor: Color(0xFF546E7A),
        bottomAppBarColor: Color(0xff313e4b),
        appBarTheme: AppBarTheme(
          color: Color(0xFF37d2b3),
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MainScreen(),
    ));
