import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'job_search_page.dart';

void main() {
  runApp(AgricultureJobsApp());
}

class AgricultureJobsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agriculture Jobs App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: WelcomePage(),
      routes: {
        '/jobSearch': (context) => JobSearchPage(),
      },
    );
  }
}
