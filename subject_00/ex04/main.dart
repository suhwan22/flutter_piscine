import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'poketmonster',
      home: PoketmonDetails(
        poketmonImage:
            "https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800",
      ),
    );
  }
}

class PoketmonDetails extends StatelessWidget {
  final String poketmonImage;

  const PoketmonDetails({Key? key, required this.poketmonImage})
      : super(key: key);

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('My Poket'),
      backgroundColor: Colors.amber[500],
      elevation: 0.0,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(poketmonImage),
            ),
          ),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 30.0,
            color: Colors.brown,
          ),
          const Text(
            'Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          const Text(
            'Pikachu',
            style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w400),
          ),
          const Text(
            'Level',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          const Text(
            'Lv.4',
            style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                'Body Blow',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                'Eletric Shocks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                'Electro Ball',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
