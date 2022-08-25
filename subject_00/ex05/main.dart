import 'package:flutter/material.dart';
import 'package:test/custom_widget/poketmon_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'poketmonster',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Poketmon> _widgetOptions = [
    Poketmon(
        name: 'Pikachu',
        level: 4,
        skills: <String>['Body Blow', 'Electric Shocks', 'Electro Ball'],
        imageURL:
            'https://mblogthumb-phinf.pstatic.net/MjAxNzAyMjVfMjMg/MDAxNDg3OTUzMTI3Mzc0._tG2RA_tY9IZcrw10kWz3YfLkhcuSRxm_rUQoLRhsQEg.hndrmcX4b8HI5c_EJB_JfftjG6C79zJXLQ0g6dZy9FQg.GIF.doghter4our/IMG_3900.GIF?type=w800'),
    Poketmon(
        name: 'Caterpie',
        level: 2,
        skills: <String>['Body Blow', 'Struggle', 'BugBite'],
        imageURL:
            'https://thumbs.gfycat.com/SilverElectricEidolonhelvum-size_restricted.gif'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            (_selectedIndex == 0 ? Colors.amber[500] : Colors.green[500]),
        appBar: _buildAppBar(),
        body: _buildBody(_widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: //Container(
            // decoration: BoxDecoration(boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Colors.black26,
            //     blurRadius: 10.0,
            //     offset: Offset(0.0, 0.75),
            //   )
            //]),
            /*child:*/ _buildBottomNavigationBar() //),
        );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('My Poket'),
      backgroundColor:
          (_selectedIndex == 0 ? Colors.amber[400] : Colors.green[400]),
    );
  }

  Widget _buildBody(Poketmon object) {
    return PoketmonDetails(
      poketmon: object,
    );
  }

  Widget _buildBottomNavigationBar() {
    return (BottomNavigationBar(
      backgroundColor:
          (_selectedIndex == 0 ? Colors.amber[300] : Colors.green[300]),
      elevation: 40,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.electric_bolt_sharp),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grass_sharp),
          label: "",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    ));
  }
}
