import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/api_service.dart';
import '../widgets/joke_card.dart';

class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  Joke? joke;

  @override
  void initState() {
    super.initState();
    getRandomJoke();
  }

  void getRandomJoke() async {
    try {
      final randomJoke = await ApiService.getRandomJoke();
      setState(() {
        joke = randomJoke;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke of the Day'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: joke != null
            ? JokeCard(joke: joke!)
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}