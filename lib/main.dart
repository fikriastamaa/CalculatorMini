import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Mengimpor halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, fontFamily: 'Poppins', color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 18.0, fontFamily: 'Poppins', color: Colors.black87),
          headlineLarge: TextStyle(fontSize: 32.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          // Gunakan bodyMedium, bodyLarge, headlineLarge, dll.
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: LoginPage(),  // Menampilkan halaman login pertama kali
    );
  }
}
