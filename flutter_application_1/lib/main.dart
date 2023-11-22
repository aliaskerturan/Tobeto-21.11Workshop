import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/pages/expenses_page.dart';
import 'package:flutter_application_1/pages/main_page.dart';

ColorScheme colorScheme1 =
    ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme1,
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme1.onPrimaryContainer,
            foregroundColor: colorScheme1.primaryContainer),
        cardTheme: CardTheme(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              bodyMedium: const TextStyle(),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}
