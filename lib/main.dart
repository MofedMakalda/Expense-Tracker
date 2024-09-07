import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

var kColorScheme =ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 44, 163, 219));
var kDarkColorScheme= ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 5, 99, 125), brightness: Brightness.dark);
void main() {
  runApp(
    MaterialApp(
      darkTheme:ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme:const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(10),
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer, 
        ) ),
             
      ) ,
      theme: ThemeData().copyWith(
        //scaffoldBackgroundColor: Color.fromRGBO(4, 82, 110, 1),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme:const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer, 
        ) ),
        textTheme:ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(fontWeight:FontWeight.bold, color: kColorScheme.onSecondaryContainer, fontSize: 16)
        ),  
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}


// Shift alt f
