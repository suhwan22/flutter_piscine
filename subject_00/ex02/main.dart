import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'widget_lifecycle',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Stateless? or Stateful?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(widget.title),
    );
  }

  @override
  void initState() {
    super.initState();
    count = 41;
  }

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  Widget _buildBody() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$count',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            _incrementCount();
            if (count == 42) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('climbing lover')));
            }
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.green,
          ),
          child: const Text('Add'),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
