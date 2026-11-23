import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'weather_screen.dart';
import 'tasks_screen.dart';
import 'contact_admin.dart';
import 'about_screen.dart';

void main() {
  runApp(StudentConnectApp());
}

class StudentConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Connect',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/weather': (context) => WeatherScreen(),
        '/tasks': (context) => TasksScreen(),
        '/contact': (context) => ContactAdminScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
