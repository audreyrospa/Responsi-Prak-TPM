import 'package:flutter/material.dart';
import 'screens/halaman_utama.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Piala Duniq 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/',
    routes: {
      '/': (context) => const MatchListScreen()
    }
    );
  }
}

