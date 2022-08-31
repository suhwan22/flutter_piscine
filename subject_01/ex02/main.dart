import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_widget',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('ex02',
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
      ),
      body: RandonWords(),
    );
  }
}

class RandonWords extends StatefulWidget {
  const RandonWords({Key? key}) : super(key: key);

  @override
  State<RandonWords> createState() => _RandonWordsState();
}

class _RandonWordsState extends State<RandonWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        final index = i ~/ 2; // ~/ 는 뒤에 오는 수로 나눈뒤 정수 반환
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          subtitle: Text(Random().nextInt(2) == 0 ? 'Done' : 'Not Yet'),
          trailing: Icon(
            Icons.favorite_border,
            color: null,
          ),
        );
      },
    );
  }
}
