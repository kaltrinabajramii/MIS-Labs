import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/jokes_list.dart';
import 'screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) => const JokesList(),
        '/random': (context) => const RandomJoke(),
      },
    );
  }
}