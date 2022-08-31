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
  final _subtitle = <String>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        _subtitle.add(Random().nextInt(2) == 0 ? 'Done' : 'Not Yet');
        if (i >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        final alreadySaved = _saved.contains(_suggestions[i]);
        return Dismissible(
          key: Key(_suggestions.elementAt(i).toString()),
          background: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Text(
                'remove',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          secondaryBackground: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 8),
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Text(
                'remove',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          onDismissed: (DismissDirection direction) {
            setState(() {
              _suggestions.removeAt(i);
              _subtitle.removeAt(i);
            });
          },
          child: Card(
            child: ListTile(
              title: Text(
                _suggestions[i].asPascalCase,
                style: _biggerFont,
              ),
              subtitle: Text(_subtitle[i]),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
              ),
              onLongPress: () {}, //길게 누르면 아무것도 작동
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[i]);
                  } else {
                    _saved.add(_suggestions[i]);
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }
}
