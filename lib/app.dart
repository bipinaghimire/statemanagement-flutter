import 'package:batchstudent/screen/dashboard.dart';
import 'package:batchstudent/screen/list_of_student.dart';
import 'package:batchstudent/screen/login.dart';
import 'package:batchstudent/screen/signup.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/signup',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          '/listofstudent': (context) => const ListOfStudentScreen(),
        });
  }
}
