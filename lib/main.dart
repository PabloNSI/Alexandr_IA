import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/colores.dart';
import 'provider/book_provider.dart';
import 'screens/load_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BookProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alexandr_IA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: charcoal),
        useMaterial3: true,
      ),
      home: const LoadScreen(),
    );
  }
}
