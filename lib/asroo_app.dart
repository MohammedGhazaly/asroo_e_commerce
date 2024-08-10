import 'package:flutter/material.dart';

class AsrooApp extends StatelessWidget {
  const AsrooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asroo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
