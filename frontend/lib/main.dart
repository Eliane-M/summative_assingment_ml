import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'job_search_page.dart';

void main() {
  runApp(const AgriculturePredictionsApp());
}

class AgriculturePredictionsApp extends StatelessWidget {
  const AgriculturePredictionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agriculture Jobs App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const WelcomePage(),
      routes: {
        '/jobSearch': (context) => const PredictionPage(),
      },
    );
  }
}
