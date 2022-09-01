import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigator',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('First Page'),
      backgroundColor: Colors.green,
    );
  }

  Widget _buildbody(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return SecondPage();
          }));
        },
        child: const Text(
          'Go to Second Page',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildbody(context),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Second Page'),
      backgroundColor: Colors.green,
    );
  }

  Widget _buildbody(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Go to Frist Page',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildbody(context),
    );
  }
}
