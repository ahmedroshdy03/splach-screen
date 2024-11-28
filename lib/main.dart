import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // شاشة البداية
        '/login': (context) => LoginPage(), // صفحة تسجيل الدخول
        '/signup': (context) => SignUpPage(), // صفحة التسجيل
      },
    );
  }
}
