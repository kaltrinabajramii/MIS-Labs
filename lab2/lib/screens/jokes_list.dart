import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';

class JokesList extends StatefulWidget {
  const JokesList({super.key});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  List<Joke> jokes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final type = ModalRoute.of(context)?.settings.arguments as String;
    getJokes(type);
  }

  void getJokes(String type) async {
    try {
      final fetchedJokes = await ApiService.getJokesByType(type);
      setState(() {
        jokes = fetchedJokes;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final type = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(joke: jokes[index]);
        },
      ),
    );
  }
}